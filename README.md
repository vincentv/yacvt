# Yet Another Curriculum Vitae Template

This repository provides a LaTeX-based curriculum vitae (CV) template inspired by the popular [Awesome-CV](https://github.com/posquit0/Awesome-CV).

## Prerequisites

Ensure you have the following installed:

1. **LaTeX distribution:** e.g., [TeX Live](https://tug.org/texlive/), [MiKTeX](https://miktex.org/), or [MacTeX](https://tug.org/mactex/).
2. **latexmk:** For automated compilation.
3. **XeLaTeX:** Required for modern font and Unicode support.
4. A terminal/command-line environment with `make`.

## Repository Structure

```plaintext
├── src/            # Directory containing LaTeX source files (.tex)
├── out/            # Output directory for compiled PDFs (generated)
├── tmp/            # Directory for auxiliary files (generated)
├── Makefile        # Makefile for build automation
├── README.md       # Project documentation (this file)
└── yacvt.sty       # Custom LaTeX style file for the CV template
```

## Getting Started

### Compile the CV

To generate your CV PDF(s), use the following commands:

- **Compile all CVs:**

  ```bash
  make all
  ```

  This compiles all `.tex` files in the `src` directory, placing the resulting PDFs in the `out/` directory.

- **Compile a specific CV:**

  ```bash
  make <filename>
  ```

  Replace `<filename>` with the base name of the desired `.tex` file (excluding the `.tex` extension). Example:

  ```bash
  make cv
  ```

### Watch Mode (Auto-Compilation)

To watch a specific `.tex` file for changes and automatically recompile:

```bash
make watch <filename>
```

Example:

```bash
make watch cv
```

This mode listens for file changes and recompiles the specified file automatically. **Note:** Ensure your PDF viewer supports auto-reloading.

### Cleaning Up

To remove all generated files (PDFs and auxiliary files):

```bash
make clean
```

## Makefile Commands Overview

| Command                 | Description                                                           |
| ----------------------- | --------------------------------------------------------------------- |
| `make all`              | Compile all `.tex` files in the `src` directory.                      |
| `make <filename>`       | Compile a specific `.tex` file.                                       |
| `make watch <filename>` | Watch and recompile a specific `.tex` file on changes.                |
| `make clean`            | Remove all compiled PDFs and auxiliary files.                         |
| `make help`             | Display help information, including a list of available `.tex` files. |

## Contributing

Contributions are welcome! If you encounter issues, have ideas for improvements, or want to add features, feel free to:

- Open an issue on this repository.
- Submit a pull request with your changes.
