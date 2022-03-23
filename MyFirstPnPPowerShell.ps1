function WriteLine($toto)
{
    Write-Host $toto;

}



function Write-Line {
Param(
        [string][Parameter(Mandatory=$true)]$Message
    )
    
    Write-Host $Message;

}


Connect-PnPOnline -Url https://devonepoint.sharepoint.com/sites/FIRSTSTEP -Interactive
$Ctx = Get-PnPContext
$Web = Get-PnPWeb

#Récupération des listes en CSOM classique
$Ctx.Load($Web.Lists) # En fait créer une requete aux web services natifs SharePoint
$Ctx.ExecuteQuery(); # La requete est exécutée, mes droits sont vérifiées, plante si je n'ai pas le droit

$Lists = $Web.Lists
foreach($List in $Lists)
{
    if($list.Title -eq "Booking")
    {
        Write-Host $List.Id
    }
}

$Lists | %{Write-Host $_.Title}
$Lists | ForEach-Object {Write-Host $_.Title}
$Booking = $Lists | Where-Object {$_.Title -eq "Booking"}

#Récupération des listes en PnP PowerShell
$Lists2 = Get-PnPList
foreach($List in $Lists2)
{
    if($list.Title -eq "Booking")
    {
        Write-Host $List.Id
    }
}

$Lists2 | %{Write-Host $_.Title}
$Lists2 | ForEach-Object {Write-Host $_.Title}
$Booking = $Lists2 | Where-Object {$_.Title -eq "Booking"}

#Utilisation d'une fonction
WriteLine "Test"

Write-Line -Message 0


write-Host $Web.Title
Disconnect-PnPOnline