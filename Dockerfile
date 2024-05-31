# Build stage
FROM golang:alpine3.19 AS build

# Install dependencies
RUN apk add --no-cache git
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
RUN CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn go install -v github.com/projectdiscovery/notify/cmd/notify@latest
# Final stage
FROM alpine:3.14
WORKDIR /app
# Copy binaries from build stage
COPY --from=build /go/bin/httpx /go/bin/subfinder /go/bin/nuclei /go/bin/notify /usr/local/bin/
COPY github_templates/ /root/nuclei-templates/github_templates/
# Copy provider-config.yaml
COPY ./provider-config.yaml /root/.config/notify/provider-config.yaml
COPY urls.txt .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
# Set the entrypoint command
ENTRYPOINT ["./entrypoint.sh"]