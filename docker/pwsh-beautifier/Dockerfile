FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14 as powershell

RUN apk update
RUN apk add git

RUN pwsh -c 'Install-Module -Name PowerShell-Beautifier -Force'

ADD pwsh-beautifier.ps1 /opt/

ENTRYPOINT [ "pwsh", "-File", "/opt/pwsh-beautifier.ps1" ]