# Packaging notes (fork of xiaolei-lab/rMVP)

| Field | Value |
|-------|-------|
| Version | `1.4.6` (conda tag == Docker tag) |
| Conda | `conda-forge::r-rmvp=1.4.6` |
| Docker | `quay.io/bioinfortools/rmvp:1.4.6` |

## Build / push

```bash
docker build --platform linux/amd64 -t quay.io/bioinfortools/rmvp:1.4.6 .
docker push quay.io/bioinfortools/rmvp:1.4.6
```

Dockerfile installs the same conda-forge pin used by `variant2qtl` modules.
