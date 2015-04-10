# Dash D/Phobos Docset

A Dash docset for the standard library docs found at [http://dlang.org/phobos](http://dlang.org/phobos).
See the releases page for a download. The docset you get just cloning the repo is empty and must be generated.

## Generating

```sh
bundle install
rake download
rake restyle
rake gen
```
