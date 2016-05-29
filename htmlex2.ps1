$one = Get-WmiObject -class Win32_Service |
 Select-Object -property Name,State |
 Where-Object -filter { $_.Mode -eq 'Auto' -and $_.State -ne 'Running' } |
ConvertTo-HTML -Fragment 

$two = Get-EventLog -LogName Security -newest 100 |
ConvertTo-HTML -Fragment 

$three = Get-Process |
ConvertTo-HTML -Fragment 

$four = Get-WmiObject -class Win32_OperatingSystem |
 Select-Object -property Caption,BuildNumber,ServicePackMajorVersion,
 @{n='LastBootTime';e={$_.ConvertToDateTime($_.LastBootUpTime)}} |
ConvertTo-HTML -Fragment 

ConvertTo-HTML -Body "$one $two $three $four" -Title "Server Status" -CssUri C:\Styels.css|
 Out-File c:\status.html
 Invoke-Item C:\status.html