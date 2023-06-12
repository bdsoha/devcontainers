## Override Feature Install Order

It is likely that you will need to have the custom CA certificate applied at an early stage of the installation build. 
To override the order of installation, add the following to your `devcontainer.json` configuration:

> **Note** The values of `overrideFeatureInstallOrder` does not contain the feature's version tag.

```jsonc
// ...
"overrideFeatureInstallOrder": [
    "ghcr.io/bdsoha/devcontainers/custom-root-ca"
],
// ...
```

## Compatible Base Images

This feature was tested with the following base images *(and should work with all of their variants)*:

- `mcr.microsoft.com/devcontainers/base:ubuntu`
- `mcr.microsoft.com/devcontainers/base:debian`
- `mcr.microsoft.com/devcontainers/base:alpine`
