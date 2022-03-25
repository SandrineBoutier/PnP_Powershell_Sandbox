#Connexion à SharePoint
Connect-PnPOnline -Url https://devonepoint.sharepoint.com/sites/FIRSTSTEP -Interactive

#Récupération des listes en PnP PowerShell
$Lists = Get-PnPList

#Récupère les noms ("Title") de toutes listes du site
$Lists | %{Write-Host $_.Title} #$Lists | ForEach-Object {Write-Host $_.Title}

#Récupère une liste uniquement par son nom (inner name/Titre = "books" et nom public = "Albums")
$Albums = $Lists | Where-Object {$_.Title -eq "books"}

#Récupère le titre de la liste dont le inner name est "books"
Write-Host $Albums.Title

#Récupère tous les éléments de la liste books (alias Albums)
Get-PnPListItem -List $Albums

#Récupère le premier élément (Id=1) de la liste books (alias Albums)
Get-PnPListItem -List $Albums -Id 1

#Récupère les valeurs de tous les champs/colonnes du 1er élément (Id=1) de la liste books (alias Albums)
(Get-PnPListItem -List books -Id 1).FieldValues

#Récupère le champ/colonne "Title" des éléments de la liste
Get-PnPListItem -List books -Fields "Title" #Get-PnPListItem -List $Albums -Fields "Title"

#Récupère la valeur du champ/colonne "Title" du premier élt de la liste
(Get-PnPListItem -List books -Id 1 -Fields "Title").FieldValues

#Récupère la valeur du champ/colonne "artist" du 2e élément de la list "books"
(Get-PnPListItem -List $Albums -Id 2)["artist"]

#Récupère le champ/colonne "artist" de la liste
Get-PnPField -List $Albums -Identity "artist"


#Récupère tous les noms de champs public (Title) et interne (InternalName) de la liste
Get-PnPField -List $Albums


Add-PnPListItem -List books -Values @{"Title" = "Rats";"style" = "rock";"artist" = "3"}
Set-PnPListItem -List books -Identity 3 -Values @{"Title" = "Rats"}
Set-PnPListItem -List books -Identity 3 -Values @{"style" = "rock"}
Set-PnPListItem -List books -Identity 3 -Values @{"artist" = "3"}

Remove-PnPListItem -List books -Identity 9 -Force
Get-PnPListItem -List $Albums

Get-PnPListItem -List Artists



#tous les éléments de la liste
$Album = Get-PnPListItem -List books

#Récupère 
$Albums | %{Write-Host $_.Title}
$Lists | ForEach-Object {Write-Host $_.Title}
$Booking = $Lists | Where-Object {$_.Title -eq "Booking"}


$Lists = Get-PnPList
$Lists | Where-Object {$_.Title -eq "books"}
