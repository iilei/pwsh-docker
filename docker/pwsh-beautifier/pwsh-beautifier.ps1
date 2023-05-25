function New-TemporaryDirectory {
  $parent = [System.IO.Path]::GetTempPath()
  do {
    $name = [System.IO.Path]::GetRandomFileName()
    $item = New-Item -Path $parent -Name $name -ItemType 'directory' -ErrorAction SilentlyContinue
  } while (-not $item)
  return $item.FullName
}

$targetDir = $(New-TemporaryDirectory)
$diff = 0

for ($i = 0; $i -lt $args.count; $i++) {
  $dir = Join-Path $targetDir $(Split-Path (Split-Path /src/$($args[$i]) -Parent))
  $file = Split-Path $($args[$i]) -Leaf

  [void]$(New-Item $dir -ItemType Directory -Force)
  cp /src/$($args[$i]) $dir

  Edit-DTWBeautifyScript (Join-Path $dir $file)

  git diff --quiet (Join-Path $dir $file) /src/$($args[$i])

  if ($LASTEXITCODE -gt 0) {
    $diff = $diff + $LASTEXITCODE
    Copy-Item (Join-Path $dir $file) /src/$($args[$i]) -Force
    Write-Host $($args[$i])
  }
}

exit $diff
