# Install Scoop Action

This GitHub Action installs the Scoop package manager on a Windows runner.

## Inputs

### `scoop_version`
(Optional) Version of Scoop to install. Defaults to the latest version.

## Example usage

```yaml
uses: DaniloAguiar/scoop-action@v1
with:
  bucket_add: main,extras