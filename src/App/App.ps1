function Install-Applications {
    $apps = @(
        "Discord.Discord",
        "Notion.Notion",
        "ShareX.ShareX",
        "Spotify.Spotify",
        "VideoLAN.VLC",
        "WinDirStat.WinDirStat",
        "ZenBrowser.ZenBrowser",
        "Mozilla.Thunderbird",
        "Microsoft.PowerToys",
        "Uniget.UnigetUI",
        "Termius.Termius",
        "Intel.Unison",
        "Seelen.SeelenUI",
        "LivelyWallpaper.LivelyWallpaper",
        "PDFgear.PDFgear",
        "Nilesoft.Shell"
    )

    foreach ($app in $apps) {
        Write-Host "Installing $app..."
        winget install --id $app --silent --accept-source-agreements --accept-package-agreements
    }
}


# Run the function
Install-Applications
