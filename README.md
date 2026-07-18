# csync2-container

Minimal csync2 image for `slim-it/flux-infra`, built from the Ubuntu packaged csync2.

`VERSION` is the single source of truth for the packaged csync2 version (the full apt version string). CI reads it for the Docker build argument and derives the release tag from it: the snapshot hash and packaging revision are dropped and dashes become dots, so the tag orders as a plain version.

## Image

CI publishes:

```text
ghcr.io/slim-it/csync2-container:<release-version>
ghcr.io/slim-it/csync2-container:latest
ghcr.io/slim-it/csync2-container:sha-<git-sha>
```

## Build locally

```sh
docker build --build-arg CSYNC2_VERSION="$(cat VERSION)" -t ghcr.io/slim-it/csync2-container:local .
```
