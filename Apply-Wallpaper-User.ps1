# Apply wallpaper for current user
$wallpaperPath = "C:\Windows\Web\Wallpaper\Company\wallpaper.jpg"

Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $wallpaperPath -Force
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value "2" -Force

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

[Wallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x0001 -bor 0x0002)
Write-Host "Wallpaper applied"