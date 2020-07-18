[CmdletBinding(SupportsShouldProcess)]
param()

$fontFiles = New-Object 'System.Collections.Generic.List[System.IO.FileInfo]'
Get-ChildItem $PSScriptRoot -Filter "MesloLGS_NF*" -Recurse | Foreach-Object {$fontFiles.Add($_)}

$fonts = $null
foreach ($fontFile in $fontFiles) {
    $shellApp = New-Object -ComObject shell.application
    $fonts = $shellApp.NameSpace(0x14)
    $fonts.CopyHere($fontFile.FullName)
}