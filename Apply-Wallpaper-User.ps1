# Apply wallpaper - interactive session version
$wallpaperPath = "C:\Windows\Web\Wallpaper\Company\wallpaper.jpg"

# Set registry
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $wallpaperPath -Force
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value "2" -Force

# Force immediate refresh by killing and restarting explorer
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 60

# Explorer will restart automatically and load the new wallpaper
Write-Host "Wallpaper applied"

