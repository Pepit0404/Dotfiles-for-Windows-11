$GitHubRepositoryAuthor = "JMOrbegoso";
$GitHubRepositoryName = "Dotfiles-for-Windows-11";
$DotfilesFolder = Join-Path -Path $HOME -ChildPath ".dotfiles";
$DotfilesWorkFolder = Join-Path -Path $DotfilesFolder -ChildPath "${GitHubRepositoryName}-main" | Join-Path -ChildPath "src";
$HelpersFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "Helpers";

Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";

# Load helpers
Write-Host "Loading helpers:" -ForegroundColor "Green";
$DotfilesHelpers = Get-ChildItem -Path "${HelpersFolder}\*" -Include *.ps1 -Recurse;
foreach ($DotfilesHelper in $DotfilesHelpers)
{
  . $DotfilesHelper;
};

Write-Host "Installing NuGet as package provider:" -ForegroundColor "Green";
Install-PackageProvider -Name "NuGet" -Force;

Write-Host "Setting up PSGallery as PowerShell trusted repository:" -ForegroundColor "Green";
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted;

Write-Host "Updating PackageManagement module:" -ForegroundColor "Green";
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
Install-Module -Name "PackageManagement" -Force -MinimumVersion 1.4.6 -Scope CurrentUser -AllowClobber -Repository "PSGallery";

# Run scripts
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Chocolatey" | Join-Path -ChildPath "Chocolatey.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Fonts" | Join-Path -ChildPath "Fonts.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode" | Join-Path -ChildPath "VSCode.ps1");

# Remove Dotfiles folder
Remove-Item $DotfilesFolder -Recurse -Force -ErrorAction SilentlyContinue;