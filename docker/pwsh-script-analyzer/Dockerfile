FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14 as powershell

RUN pwsh -c 'Install-Module -Name PSScriptAnalyzer -Force'

ADD pwsh-script-analyzer.ps1 /opt/

ENTRYPOINT [ "pwsh", "-File", "/opt/pwsh-script-analyzer.ps1" ]