# A Dev Container Template for Writing Scientific Work using the LaTeX-Workshop Extension

## Repo and Template Structure

This repository contains _one_ Template - `thesis`. This Templates serves as a template implementation which forms the basis for writing a LaTeX paper. Similar to the [`devcontainers/templates`](https://github.com/devcontainers/templates) repo, this repository has a `src` folder. Each Template has its own sub-folder, containing at least a `devcontainer-template.json` and `.devcontainer/devcontainer.json`.

```
├── src
│   ├── thesis
│   │   ├── devcontainer-template.json
│   │   └──| .devcontainer
│   │      ├── devcontainer.json
│   │      └── Dockerfile
...
```

### Options

All available options for a Template should be declared in the `devcontainer-template.json`. The syntax for the `options` property can be found in the [devcontainer Template json properties reference](https://containers.dev/implementors/templates#devcontainer-templatejson-properties).

An [implementing tool](https://containers.dev/supporting#tools) will use the `options` property from [the documented Dev Container Template properties](https://containers.dev/implementors/templates#devcontainer-templatejson-properties) for customizing the Template. See [option resolution example](https://containers.dev/implementors/templates#option-resolution-example) for details.

## Distributing Templates

### Versioning

Templates are individually versioned by the `version` attribute in a Template's `devcontainer-template.json`. Templates are versioned according to the semver specification. More details can be found in [the Dev Container Template specification](https://containers.dev/implementors/templates-distribution/#versioning).

### Publishing

> NOTE: The Distribution spec can be [found here](https://containers.dev/implementors/templates-distribution/).
>
> While any registry [implementing the OCI Distribution spec](https://github.com/opencontainers/distribution-spec) can be used, this template will leverage GHCR (GitHub Container Registry) as the backing registry.

Templates are source files packaged together that encode configuration for a complete development environment.

This repo contains a GitHub Action [workflow](.github/workflows/release.yaml) that will publish the template to GHCR. The Template in this repository can be referenced by an [implementing tool](https://containers.dev/supporting#tools) with:

```
ghcr.io/torbenwetter/iu-latex-container-templates/thesis:latest
```

The provided GitHub Action will also publish a third "metadata" package with just the namespace, eg: `ghcr.io/torbenwetter/iu-latex-container-templates`. This contains information useful for tools aiding in Template discovery.

'`torbenwetter/iu-latex-container-templates`' is known as the template collection namespace.

### Marking Template Public

For the Template to be used, it currently needs to be available publicly. By default, OCI Artifacts in GHCR are marked as `private`.

To make them public, navigate to the Template's "package settings" page in GHCR, and set the visibility to 'public`.

```
https://github.com/users/TorbenWetter/packages/container/iu-latex-container-templates%2Fthesis/settings
```

### Adding the Template to the Index

Next you will need to add the Template to our [public index](https://containers.dev/templates) so that other community members can find it. Just follow these steps:

- Go to [github.com/devcontainers/devcontainers.github.io](github.com/devcontainers/devcontainers.github.io)
  - This is the GitHub repo backing the [containers.dev](https://containers.dev/) spec site
- Open a PR to modify the [collection-index.yml](https://github.com/devcontainers/devcontainers.github.io/blob/gh-pages/_data/collection-index.yml) file

This index is from where [supporting tools](https://containers.dev/supporting) like [VS Code Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [GitHub Codespaces](https://github.com/templates/codespaces) surface Templates for their Dev Container Creation Configuration UI.

### Updating Documentation

This repo contains a GitHub Action [workflow](.github/workflows/release.yaml) that will automatically generate documentation (ie. `README.md`) for the Template. This file will be auto-generated from the `devcontainer-template.json` and `NOTES.md`.
