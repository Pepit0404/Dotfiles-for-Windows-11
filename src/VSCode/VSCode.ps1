function Set-VSCode-Configuration {
  $VSCodeSettingsPath = Join-Path -Path $env:appdata -ChildPath "Code" | Join-Path -ChildPath "User";
  $DotfilesVSCodeSettingsFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode";
  
  if (-not (Test-Path -Path $VSCodeSettingsPath)) {
    Write-Host "Configuring Visual Studio Code:" -ForegroundColor "Green";
    New-Item $VSCodeSettingsPath -ItemType directory;
  }

  Get-ChildItem -Path "${DotfilesVSCodeSettingsFolder}\*" -Include "*.json" -Recurse | Copy-Item -Destination $VSCodeSettingsPath;
}

choco install -y "vscode" --params "/NoDesktopIcon /NoQuicklaunchIcon /NoContextMenuFiles /NoContextMenuFolders";
Set-VSCode-Configuration;
refreshenv;

code --install-extension "formulahendry.auto-rename-tag";
code --install-extension "github.copilot";
code --install-extension "eamodio.gitlens";
code --install-extension "michaelzhou.fleet-theme";
code --install-extension "glenn2223.live-sass";
code --install-extension "yandeu.five-server";
code --install-extension "gruntfuggly.todo-tree";
code --install-extension "ms-vscode-remote.remote-ssh";
code --install-extension "ms-azuretools.vscode-docker";
code --install-extension "usernamehw.errorlens";
code --install-extension "oderwat.indent-rainbow";
code --install-extension "davidanson.vscode-markdownlint";
code --install-extension "robole.markdown-snippets";
code --install-extension "pkief.material-icon-theme";
code --install-extension "ms-vscode-remote.remote-containers";
code --install-extension "ms-vscode-remote.remote-wsl";
code --install-extension "rangav.vscode-thunder-client";