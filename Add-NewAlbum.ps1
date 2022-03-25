
#Connexion à SharePoint
Connect-PnPOnline -Url https://devonepoint.sharepoint.com/sites/FIRSTSTEP -Interactive

#Récupère la liste dont inner name/Title = "books" et nom public = "Albums")
$Albums = Get-PnPList -Identity "books"
Start-App


function Start-App
{
$newCD = @{}
$newCD.Add("Title", $null)
$newCD.Add("Style", $null)
$newCD.Add("ArtistId", $null)
$newCD.Add("Stock", $null)
$newCD.Add("AlbumRelease", $null)
#$newCD.Add("price", $null)

$newCD.Title = Get-AlbumTitle
$newCD.Style = Select-AlbumStyle
$newCD.ArtistId = Select-Artist
$newCD.Stock = [int](Read-Host "Veuillez renseigner le stock actuel")
$newCD.AlbumRelease = (Read-Host "Veuillez renseigner la date de sortie de l'album (format:MM/JJ/YYYY)")

Add-NewAlbum -List $Albums -NewAlbum $newCD
Show-UpdatedAlbumList
#Show-NewAlbum
}


function Get-AlbumTitle
{
    return Read-Host "Quel album souhaitez vous ajouter?"
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
    Write-Host "Vous avez choisi: $($choice)"
    return $choice
}

function Select-Artist
{
    $Artists = Get-PnPList -Identity "Artists"
    $ArtistItems = Get-PnPListItem -List $Artists
    $ArtistItems | ForEach-Object {Write-Host "$($_.Id)) $($_["Title"])"}
    
    $albumArtist = Read-Host "sélectionnez un artiste: 1-9"

    #Si mon chiffre est supérieur à 9 alors récursif sinon c'est que c'est bon
    
    Write-Host "Vous avez choisi: $($albumArtist)"
    return $albumArtist
}

function Add-NewAlbum
{
    Param(
        $List,
        $NewAlbum
    )
    Add-PnPListItem -List "books" -Values @{"Title" = $NewAlbum.Title;"artist" = $NewAlbum.ArtistId;"style" = $NewAlbum.Style;"stock" = $newCD.Stock;"dateOfRelease" = $NewAlbum.AlbumRelease}
}

function Show-UpdatedAlbumList
{
    Get-PnPListItem -List $Albums
}