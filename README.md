# pester

```bash
cd docker
docker build -t pester - < pester.Dockerfile
cd -
```

# beautifier

```bash
cd docker
docker build -t pwsh-beautifier  .
cd -
```

# Run
```bash
docker run -it -v $(pwd):/src --workdir /src pester 
```

```bash
docker run -it -v $(pwd):/src --workdir /src pwsh-beautifier -- docker/pwsh-beautifier/pwsh-beautifier.ps1
```