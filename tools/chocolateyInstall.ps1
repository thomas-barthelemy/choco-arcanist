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

    git clone --depth 1 -q https://github.com/phacility/libphutil.git "$libphutilPath"
    git clone --depth 1 -q https://github.com/phacility/arcanist.git "$arcanistPath"

} catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}
