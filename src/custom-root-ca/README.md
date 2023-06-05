
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
| source | Remote location of the certificate in PEM format to be added | string | https://netfree.link/cacert/isp/018/ca.crt |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/bdsoha/devcontainers/blob/main/src/custom-root-ca/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
