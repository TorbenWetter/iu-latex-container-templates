# IU LaTeX Dev Container Template

A Development Container Template for writing scientific theses at IU International University using VS Code's LaTeX Workshop extension. This template provides a complete, pre-configured LaTeX development environment.

## Overview

This template is part of an integrated LaTeX toolchain for IU students:

1. [IU LaTeX Package](https://github.com/TorbenWetter/iu-latex-package) - The core LaTeX package providing document classes and formatting for IU theses
2. [IU LaTeX Container Image](https://github.com/TorbenWetter/iu-latex-container-image) - A Docker image with TeXLive and the IU LaTeX package pre-installed
3. This Template - A Dev Container configuration that uses the above components to provide a ready-to-use development environment

## Features

- Pre-configured VS Code environment with LaTeX Workshop extension
- Full TeX Live installation via the IU LaTeX Container Image
- IU LaTeX Package pre-installed and configured
- Sample thesis structure with example files
- Automatic builds and PDF previews
- Git-ready with appropriate `.gitignore`

## Getting Started

### Prerequisites

- VS Code with the Dev Containers extension
- Docker Desktop (Windows/macOS) or Docker Engine (Linux)

### Usage

1. Create a new repository using this template:

   ```
   ghcr.io/torbenwetter/iu-latex-container-templates/thesis:latest
   ```

2. Open the repository in VS Code and click "Reopen in Container" when prompted

3. Start writing your thesis by modifying `main.tex`

## Repository Structure

```
├── .devcontainer/          # Dev Container configuration
├── images/                 # Place your images here
│   ├── image.jpg          # Example image
│   └── logo.png           # IU logo
├── main.tex               # Main thesis document
└── main.bib               # Bibliography file
```

## Template Options

The template can be customized through options in `devcontainer-template.json`. See the [Dev Container Template specification](https://containers.dev/implementors/templates#devcontainer-templatejson-properties) for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Related Projects

- [IU LaTeX Package](https://github.com/TorbenWetter/iu-latex-package) - The core LaTeX package for IU theses
- [IU LaTeX Container Image](https://github.com/TorbenWetter/iu-latex-container-image) - The Docker image used by this template

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Technical Details

### Template Distribution

This template is published to GitHub Container Registry (GHCR) and can be referenced as:

```
ghcr.io/torbenwetter/iu-latex-container-templates/thesis:latest
```

### Documentation

Documentation is automatically generated from `devcontainer-template.json` and `NOTES.md` via GitHub Actions.

### Version Control

Templates are versioned according to semver specification in each template's `devcontainer-template.json`.
