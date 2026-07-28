# csync2-container

Minimal csync2 image built from the Ubuntu packaged csync2.

`VERSION` is the single source of truth for the packaged csync2 version (the full apt version string). CI reads it for the Docker build argument and derives the release tag from it: the snapshot hash and packaging revision are dropped, dashes become dots, and the build number is appended.

The build number is part of the tag so that every rebuild publishes a strictly higher one. A new packaging revision of the same upstream version, or a base image update, otherwise replaces the contents of an existing tag in place — and a consumer pinning that tag has no way to notice there is anything new. The exact packaged version inside an image is recorded in its `nl.slim-it.csync2.version` label.

## Image

CI publishes:

```text
ghcr.io/slim-it/csync2-container:<csync2-version>.<build>
ghcr.io/slim-it/csync2-container:latest
ghcr.io/slim-it/csync2-container:sha-<git-sha>
```

## Build locally

```sh
docker build --build-arg CSYNC2_VERSION="$(cat VERSION)" -t ghcr.io/slim-it/csync2-container:local .
```
