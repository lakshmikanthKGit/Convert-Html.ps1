$a=Get-Service |?{$_.Status -eq "Running"}|Select-Object Name,Status
$b= "<Style> body{background-Color:Red}"
$B=$b+"TABLE{border-width: 2px;Padding :1px;border-style:Double;border-color: Black;border-collapse: collapse;}"
$b=$b+"TH{border-width: 2px;Padding: 10px;border-style:Double;border-color: black;BackGround-Color:Green}"
$b=$b+"TD{border-width: 2px;Padding: 10px;border-style:Groove;border-color: black;}"
$b=$b+"</style>"
$one=$a|ConvertTo-Html -Fragment
$c=Get-Service |?{$_.Status -ne "Running"}|Select-Object Name,Status
$two=$c|ConvertTo-Html -Fragment
ConvertTo-Html -Body "<H3>Services Info</H3>,$one,$two" -CssUri C:\temp\style.css -Title "Services info" |Out-File -FilePath C:\temp\Test.html
Invoke-Item C:\temp\Test.html