# osx-learn ![`bin/sh`][bash]

> Add words to OS X’s valid words list, as in, remove warnings about words
> like `npm`.

Tested on OS X 10.10 (Yosemite) and 10.13 (High Sierra), might work earlier.

If a language is specified, the language designator (ISO 639-1 or ISO 639-2)
must be lower-case, e.g., `nl`.
When a region designator (ISO 3166-1) is added, it must be all-caps and
preceded by an underscore, e.g., `en_GB`.

Ensure the language is enabled in `System Preferences` > `Keyboard` >
`Text` > `Spelling` > `Set Up...`.

When adding a word to a language which has region designators (such as English,
which has British and more), **YOU MUST SPECIFY THE REGION TOO**.
In the case of British, specifying `en` will not work, but `en_GB` will.

## Install

[npm][]:

```bash
npm install osx-learn --global
```

## Usage

```text
Usage: learn [options] <word> [language]

Options:

  -h, --help     output usage information
  -v, --version  output version

Examples:

  $ learn npm
  $ learn stringification en_GB

See also: man 1 learn
```

## License

[MIT][] © [Titus Wormer][author]

[bash]: https://img.shields.io/badge/bin-sh-89e051.svg
[npm]: https://docs.npmjs.com/cli/install
[mit]: LICENSE
[author]: http://wooorm.com
