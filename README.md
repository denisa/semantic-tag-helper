# semantic-tag-helper
[![version](https://img.shields.io/github/v/release/denisa/semantic-tag-helper?include_prereleases&sort=semver)](https://github.com/denisa/semantic-tag-helper/releases)
[![semantic versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-informational)](https://semver.org/spec/v2.0.0.html)
[![linter](https://github.com/denisa/semantic-tag-helper/actions/workflows/linter.yaml/badge.svg)](https://github.com/denisa/semantic-tag-helper/actions/workflows/linter.yaml)

## Summary
GitHub action to help set a semantic tag, keeping major and minor tags current.

This action is inspired by GitHub:
"We recommend creating releases using semantically versioned tags – for example, v1.1.3 –
and keeping major (v1) and minor (v1.1) tags current to the latest appropriate commit."

### Experimental feature
If the tag is a prerelease tag, this action will attempt to create appropriate tags,
but this is _experimental_.

### Example
For the tag `v1.2.3`, this will create a new tag `v1.2.3`, and create or move `v1.2` and `v1`.

For the tag `v1.2.3-alpha.4.5.6`, this will create a new tag `v1.2.3-alpha.4.5.6`,
and create or move `v1.2.3-alpha.4.5`, `v1.2.3-alpha.4`, `v1.2.3-alpha`.

## Inputs

### `mode`
One of `test` or `set`.

### `tag`
The name of the tag. The tag _must_ adhere to SemVer 2.0.0 and _should_ start with a `v`.

## Example Usage

### Pull-request
This build validates that the tag does not exist.
To that effect, add
```yaml
- id: clq-extract
  uses: denisa/clq-action@v1
  with:
    mode: feature
- uses: denisa/semantic-tag-helper@v1
  with:
    mode: test
    tag: ${{ steps.clq-extract.outputs.tag }}
```

### Release Branch
This build must extract from the changelog all the information needed to cut a new release.
Use
```yaml
- uses: denisa/clq-action@v1
  id: clq-extract
- uses: denisa/semantic-tag-helper@v1
  with:
    mode: set
    tag: ${{ steps.clq-extract.outputs.tag }}
- uses: ncipollo/release-action@v1.10.0
  with:
    tag: ${{ steps.clq-extract.outputs.tag }}
    prerelease: ${{ steps.clq-extract.outputs.status == 'prereleased' }}
    name: ${{ steps.clq-extract.outputs.name }}
    body: ${{ steps.clq-extract.outputs.changes }}
```
