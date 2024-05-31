# VulnNotifier
VulnNotifier is a Security SaaS tool designed to enhance the security of web applications by identifying vulnerabilities in URLs and their subdomains. It leverages a combination of powerful security tools to automate the detection of potential security issues and provides real-time notifications through Slack.
## Features
* URL Scanning: Input URLs are scanned using [httpx](https://github.com/projectdiscovery/httpx) to validate their accessibility.
* Subdomain Discovery: Utilizes [subfinder](https://github.com/projectdiscovery/subfinder) to identify subdomains associated with the given URLs.
* Vulnerability Assessment: Checks subdomains for vulnerabilities using [nuclei](https://github.com/projectdiscovery/nuclei).
* Real-time Alerts: Sends notifications to Slack (or any other application [notify](https://github.com/projectdiscovery/notify) supports) if vulnerabilities are detected.

## Prerequisites
* Docker
* slack account and webhook for a private channel
* 
## Usage
1. Clone the Repository:
```
git clone https://github.com/kaxem/VulnNotifier.git && cd VulnNotifier
```
2. Change provider-config with your slack information
3. Build docker image:
```
docker build -t VulnNotifier:v0.1 .
```
4. Run the docker container::
```
docker run -d VulnNotifier:v0.1
```

Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas or improvements.
