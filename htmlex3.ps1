$Header = @"
<style>
TABLE {border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}
TH {border-width: 1px;padding: 3px;border-style: solid;border-color: black;background-color: #6495ED;}
TD {border-width: 1px;padding: 3px;border-style: solid;border-color: black;}
.odd  { background-color:#ffffff; }
.even { background-color:#dddddd; }
</style>
<title>
Title of my Report
</title>
"@
$Pre = "Heading before the report"
$Post = "Footer after the report"
 
$MyObject | Select 'Folder Name',Owner,'Created On','Last Updated',Size | ConvertTo-HTML -Head $Header -PreContent $Pre -PostContent $Post | Set-AlternatingRows -CSSEvenClass even -CSSOddClass odd