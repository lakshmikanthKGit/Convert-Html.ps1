$c='<Style>body{Background-Color:lightBlue}'
$c=$c+'th{background-color:Green;border:1px solid black}'
$c=$c+'table {background-color: white; Padding: 5px;float:left;margin :5px;border-style:Solid}'
$c=$c+'Td{background-color:Pink;Border-style: Solid;}'
$c=$c+'</style>'
$a=get-service|?{$_.Status -eq "running"}|Select Name,Status|ConvertTo-Html -Fragment
$b=get-service|?{$_.Status -ne "running"}|Select Name,Status|ConvertTo-Html -Fragment
ConvertTo-Html -Body "$a $B" -Head "$C"|Out-File C:\temp\test1.html
Invoke-Item -Path C:\temp\test1.html
#jygrfuyf
