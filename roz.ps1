# --- BACKGROUND PERSISTENCE LOGIC ---
# If this script is NOT running as a background job, start it as one.
if ($null -eq $PSJob) {
    # Start this script as a background job named "PrankJob"
    Start-Job -ScriptBlock {
        # Define error messages
        $errorMessages = @(
            "Critical Error: Keyboard requires cleaning. Cookie crumbs detected.",
            "System Error: Monitor detects poor posture. Spinal recalibration recommended.",
            "Error: Mouse movement detected but no actual work being done.",
            "Warning: Your desk chair has detected extended sitting periods. Please stand up.",
            "Error: 404 Motivation not found.",
            "Alert: Your computer is lonely. Please talk to it.",
            "Critical Failure: Internet history requires deletion. Guests arriving soon."
        )
        
        # Load necessary UI assembly
        Add-Type -AssemblyName PresentationFramework
        
        # Infinite prank loop
        while ($true) {
            # Play annoying sound (500Hz for 300ms)
            [System.Console]::Beep(500, 300)
            
            # Pick a random message
            $msg = $errorMessages | Get-Random
            
            # Show the error box (this steals keyboard focus)
            [System.Windows.MessageBox]::Show($msg, "System Error", "OK", "Error")
            
            # Wait 1-3 seconds
            Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 4)
        }
    } -Name "PrankJob" | Out-Null
    
    # Exit the main console immediately
    exit
}
