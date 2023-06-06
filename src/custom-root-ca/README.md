
# Custom Root CA (custom-root-ca)

🔒 Add a custom Root CA to your development environment

## Example Usage

```json
"features": {
    "ghcr.io/bdsoha/devcontainers/custom-root-ca:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| name | Name of the custom root CA | string | custom-root-ca.crt |
| source | Remote location *(or comma seperated locations)* of the certificate in PEM format to be added | string | https://netfree.link/cacert/isp/018/ca.crt |

## Override Feature Install Order

It is likely that you will need to have the custom CA certificate applied at an early stage of the installation build. To override the order of installation, add the following to your `devcontainer.json` configuration:

```jsonc
// ...
"overrideFeatureInstallOrder": [
    "ghcr.io/bdsoha/devcontainers/custom-root-ca:1"
],
// ...
```

## Compatible Base Images

This feature was tested with the following base images *(and should work with all of their variants)*:
- `mcr.microsoft.com/devcontainers/base:ubuntu`
- `mcr.microsoft.com/devcontainers/base:debian`
- `mcr.microsoft.com/devcontainers/base:alpine`


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/bdsoha/devcontainers/blob/main/src/custom-root-ca/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
