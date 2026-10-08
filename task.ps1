# Write your code here
$result = @()
[string]$version = "Standard_B2pts_v2"
$regions = Get-ChildItem "data"
foreach ($region in $regions) {
    $name = $region.Name
    $data = Get-Content $region | Where-Object {$_ -match $version}
    if($data){
        $result += $name
    }
}

$result | ConvertTo-Json | Out-File -FilePath "result.json"