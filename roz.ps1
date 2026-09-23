# --- CONFIGURATION ---
$errorMessages = @(
    "Critical Error: Keyboard requires cleaning. Cookie crumbs detected.",
    "System Error: Monitor detects poor posture. Spinal recalibration recommended.",
    "Error: You have clicked your mouse 500 times. You are officially tired.",
    "Alert: Coffee levels critically low. Please refill immediately.",
    "Warning: Your desk chair has detected extended sitting periods. Please stand up.",
    "Error: 404 Motivation not found. Please try again tomorrow.",
    "System Alert: High levels of sarcasm detected in recent emails.",
    "Error: Mouse movement detected but no actual work being done.",
    "Warning: Your computer is lonely. Please talk to it.",
    "Critical Failure: Internet history requires deletion. Guests arriving soon."
)

# --- FUNCTION: SHOW ERROR ---
function Show-FakeError {
    param($message)
    Add-Type -AssemblyName PresentationFramework
    # The [System.Windows.MessageBox]::Show command automatically steals focus
    [System.Windows.MessageBox]::Show($message, "Windows System Critical Update", "OK", "Error")
}

# --- MAIN LOOP ---
# This loop runs indefinitely with 1-3 second delays
while ($true) {
    $randomError = $errorMessages | Get-Random
    
    # Annoying system beep (Frequency 500Hz, Duration 300ms)
    [System.Console]::Beep(500, 300)
    
    # Display the error
    Show-FakeError -message $randomError
    
    # Random delay between 1 and 3 seconds
    $delay = Get-Random -Minimum 1 -Maximum 4
    Start-Sleep -Seconds $delay
}
