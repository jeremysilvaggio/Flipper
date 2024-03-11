if (-not (Get-Module -Name Input)) {
  Install-Module Input
}

Import-Module Input

function Close-Session {
  [System.Windows.Input.Keyboard]::Press(
    [System.Windows.Input.KeyInterop]::ConvertToVirtualKey('L', [System.Windows.Input.ModifierKeys]::Windows)
  )
}

while ($true) {
  if ([System.Windows.Input.Mouse]::GetPosition().X -ne $lastMouseX -or
    [System.Windows.Input.Mouse]::GetPosition().Y -ne $lastMouseY) {
    Close-Session
    break
  }

  if ([System.Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::Any)) {
    Close-Session
    break
  }

  $lastMouseX = [System.Windows.Input.Mouse]::GetPosition().X
  $lastMouseY = [System.Windows.Input.Mouse]::GetPosition().Y

  Start-Sleep -Milliseconds 100
}