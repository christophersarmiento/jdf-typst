# Joyner Document Format

This is an **unofficial** port of the Joyner Document Format v2.2 to [Typst](https://typst.app/), derived from Jake Warner's [repository](https://github.com/iamjakewarner/jdf/tree/master)

## Typst Installation

If you already have Typst installed and configured for your OS than you can likely skip to Quick Start section

### MacOS

```sh
brew install typst
```

### Linux

- View [Typst on Repology](https://repology.org/project/typst/versions)
- View [Typst's Snap](https://snapcraft.io/typst)

### Windows

```sh
winget install --id Typst.Typst
```

## CLI Quick start

You can clone this repo and try compiling `jdf-starter.typ`
with the following commands:

```sh
typst compile jdf-starter.typ
```

The result should look like `jdf-starter.pdf`.

## Source Files

- `jdf.csl` is the citation style definition. This repository uses a modified version of the template found [here](https://github.com/citation-style-language/styles/blob/b14d5c334934bf6c72aa164aba22d3d467988327/apa.csl)
- `jdf.typ` defines the layout and formatting of the typst document
  - Typst and Word / Google Docs measure spaces differently, you can read more about it [here](https://typst.app/docs/reference/model/par/#parameters-leading)
  - Because of this, you might see some of the spacing defined doesn't technically match the spacings defined in the document, however I've done my best to visually match the spacing after hours of tinkering
- `jdf-starter.typ` is a starter document that imports the JDF format and demonstrates its usage

## License

Copyright 2025 Christopher Sarmiento.

You have my permission to use JDF in whatever projects you wish,
whether commercial, personal, or otherwise, in whatever way you like.
Official license information can be found in [LICENSE](LICENSE)
