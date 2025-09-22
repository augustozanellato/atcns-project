# ATCNS Project: Fuzzing and Scanning Connected-Car APIs

In this repository there are scripts that can be used to reproduce the work made by me and Leonardo Costa (@lerro-lerro) as part of the project for the course _Advanced Topics in Computer and Network Security_ held during the Academic Year 2024/2025 of the MSc in Cybersecurity at University of Padua.

## Prerequisites

- [Ax Framework](https://github.com/attacksurge/ax): tested with commit `f5be1a2452954a708828257fae9edb472cf8b213`
- [subfinder](https://github.com/projectdiscovery/subfinder): tested with version 2.8.0
- [nuclei](https://github.com/projectdiscovery/nuclei): tested with version 3.4.10
- [feroxbuster](https://github.com/epi052/feroxbuster): tested with version 2.12.0
- [httpx](https://github.com/projectdiscovery/httpx): tested with version 1.7.1
- [jq](https://github.com/jqlang/jq): tested with version 1.8.1
- in-scope domains list in a text file with one domain per line
- a ProjectDiscovery cloud API key, set it up using `export PDCP_API_KEY="yourkeyhere"`
- wordlists downloaded using `00-download-wordlists.sh`

## Steps

1. Run `01-enumerate-subdomains.sh path/to/domain/list.txt subfinder_out`
2. Run `02-filter-alive-hosts.sh subfinder_out alive_hosts.txt`
3. Run `03-enumerate-apidocs.sh alive_hosts.txt api_docs`
    - `api_docs.txt` will contain a list of found api documentation endpoints, load them into ZAP via `Import > Import an OpenAPI definition` and putting there the documentation URL.
4. Run `04-enumerate-api-endpoints.sh alive_hosts.txt api_endpoints`
   - `api_endpoints.txt` will contain a list of found api endpoints, this can be loaded into ZAP via `Import > Import a File containing URLs`.
5. Run `05-scan-hosts.sh alive_hosts.txt nuclei_results.ndjson`
   - Results will be contained into `nuclei_results.ndjson` and will also be uploaded to ProjectDiscovery Cloud to facilitate analysis.
