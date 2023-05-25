$code = 0

for ($i = 0; $i -lt $args.count; $i++) {
    Invoke-ScriptAnalyzer -Path /src/$($args[$i])
    $code = $code + $LASTEXITCODE
}

exit $code
