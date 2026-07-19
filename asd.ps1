Path to the manualmap.exe (adjust if different)
$exePath = "C:\Users\ccsgo\Downloads\Manualmap.exe"

Arguments for the program: dllName, processName, and dllPath (adjust with real values)
$dllName = "C:\Users\ccsgo\Downloads\Inject.dll"  # Name of the injection DLLIMPORT
$processName = "cmd.exe"  # Name of the target process
$dllPath = "C:\Users\ccsgo\Downloads\AutoClickers.exe"  # Full path to the DLL to inject

if (-not (Test-Path $exePath)) {
    exit
}

if (-not (Test-Path $dllPath)) {
    exit
}

$bytes = [System.IO.File]::ReadAllBytes($exePath)
$asm = [System.Reflection.Assembly]::Load($bytes)
$argsArray = [string[]] @($dllName, $processName, $dllPath)
$asm.EntryPoint.Invoke($null, (, $argsArray)) 
