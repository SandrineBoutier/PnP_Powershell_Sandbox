
#Connexion à SharePoint
Connect-PnPOnline -Url https://devonepoint.sharepoint.com/sites/FIRSTSTEP -Interactive

#Récupère la liste dont inner name/Title = "books" et nom public = "Albums")
$Lists = Get-PnPList
$Albums = $Lists | Where-Object {$_.Title -eq "books"}
Start-App


function Start-App
{
Get-AlbumTitle
Select-AlbumStyle
Select-Artist
Add-NewAlbum
Show-UpdatedAlbumList
#Show-NewAlbum
}


function Get-AlbumTitle
{
    $newAlbum = Read-Host "Quel album souhaitez vous ajouter?"
    return $newAlbum 
}


function Select-AlbumStyle
{
    Write-Host "1) Rock"
    Write-Host "2) Electro"
    Write-Host "3) Pop"
    Write-Host "4) Rap"
    Write-Host "5) Jazz"
    Write-Host "6) Classical"
    Write-Host "7) Metal"

    $albumStyle = Read-Host "sélectionnez un genre musical: 1-7"

    Switch ($albumStyle)
    {
       1 {$choice = "rock"}
       2 {$choice = "electro"}
       3 {$choice = "pop"}
       4 {$choice = "rap"}
       5 {$choice = "jazz"}
       6 {$choice = "classical"}
       7 {$choice = "metal"}
    }
    Write-Host "Vous avez choisi:"
    Write-Host $albumStyle
    return $albumStyle
}

function Select-Artist
{
    Write-Host "1) Pixies"
    Write-Host "2) Radiohead"
    Write-Host "3) Balthazar"
    Write-Host "4) Metronomy"
    Write-Host "5) The Strokes"
    Write-Host "6) Orchestre National de Lyon"
    Write-Host "7) Nine Inch Nails"
    Write-Host "8) Beirut"
    Write-Host "9) Tame Impala"

    $albumArtist = Read-Host "sélectionnez un artiste: 1-9"

    Switch ($albumArtist)
    {
        1 {$albumArtist = "1"}
        2 {$albumArtist = "2"}
        3 {$albumArtist = "3"}
        4 {$albumArtist = "4"}
        5 {$albumArtist = "5"}
        6 {$albumArtist = "6"}
        7 {$albumArtist = "7"}
        8 {$albumArtist = "8"}
        9 {$albumArtist = "9"}
    }
    Write-Host "Vous avez choisi:"
     Write-Host $albumArtist
    return $albumArtist
}

function Add-NewAlbum
{
    Add-PnPListItem -List $Albums -Values @{"Title" = $newAlbum;"style" = $albumStyle;"artist" = $albumArtist}
}

function Show-UpdatedAlbumList
{
Get-PnPListItem -List $Albums
}

#function Show-NewAlbum
#{
#Récupère la valeur du champ/colonne "Title" du premier élt de la liste
#(Get-PnPListItem -List books -Id 1 -Fields "Title").FieldValues
#}
