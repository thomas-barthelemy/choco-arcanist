$validExitCodes = @(0)

$packageName = 'arcanist'
$baseDir = $env:chocolateyPackageFolder
$libphutilPath = "$baseDir\libphutil"
$arcanistPath = "$baseDir\arcanist"

try {
    if(Test-Path $libphutilPath) {
        rm -r -f $libphutilPath
    }
    if(Test-Path $arcanistPath) {
        rm -r -f $arcanistPath
    }

    Install-ChocolateyZipPackage 'libphutil' `
        https://github.com/phacility/libphutil/archive/master.zip `
        $libphutilPath

    Install-ChocolateyZipPackage 'arcanist' `
        https://github.com/phacility/arcanist/archive/master.zip `
        $arcanistPath

    if(!(Get-Command arc -errorAction SilentlyContinue)) {
        Install-ChocolateyPath $arcanistPath/bin
    }

} catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}
