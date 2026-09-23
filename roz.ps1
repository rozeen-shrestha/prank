# --- WRAPPER: HIDE CONSOLE WINDOW ---
# This hides the console window but allows the process to interact with the desktop
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")] public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

# --- PRANK LOGIC ---
$errorMessages = @(
    "Critical Error: Keyboard requires cleaning.",
    "System Error: Monitor detects poor posture.",
    "Error: Mouse movement detected but no work.",
    "Warning: Desk chair detects laziness.",
    "Error: 404 Motivation not found."
)

Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    # Annoying Beep
    [System.Console]::Beep(500, 300)
    $msg = $errorMessages | Get-Random
    
    # Standard MessageBox (Now allowed to show because the process is interactive)
    [System.Windows.Forms.MessageBox]::Show($msg, "System Error", 
        [System.Windows.Forms.MessageBoxButtons]::OK, 
        [System.Windows.Forms.MessageBoxIcon]::Error)
    
    Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 4)
}
