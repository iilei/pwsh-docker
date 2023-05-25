FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14 as powershell

RUN pwsh -c 'Install-Module -Name Pester -Force'

ENTRYPOINT [ "pwsh", "-Command", "&", "Invoke-Pester ; Exit $LastExitCode"]