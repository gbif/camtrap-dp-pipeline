# Camtrapt to DWCA converter (Docker image)

This Docker container packages an R script that transforms [Camtrap DP](https://tdwg.github.io/camtrap-dp/) into an expanded DwC-A directory.

Example usage:

```bash
./run.sh source-dp dest-dwca 'Dataset name'
```

`source-dp` should be a path to an extracted data package.  The DwC-A will be written to `dest-dwca`.  `'Dataset name'` is the title of the dataset.

Preliminary testing recommends a minimum of 4 GB to run this container, though large datasets may require more memory.

## R

Install R using Homebrew:

```bash
brew install r
```

Once installed, check the version:

```bash
R --version
```

or start R in the terminal:

```bash
R
```

## Install packages

To install Camtrap packages run:

```bash
Rscript install_packages.R
```

There might be an issue with jq library when installing:

```
fatal error: 'jq.h' file not found
```

Then try to run this to install the library:

```bash
brew install jq
```

and try to re-run the install_packages script again.


## Dockerfile

The [Dockerfile file](Dockerfile) creates an image trying to use binary packages whenever is possible, some source packages are installed by using the file [install_packages.R](R/install_packages.R)
Additionally, the file provides volume definitions for the input and output directories.

The image can be built using the [build.sh](build.sh) by simply running the script.
