# Camtraptor to DWCA converter (Docker image)

This Docker container packages an R script that transforms [CamTrapDP](https://tdwg.github.io/camtrap-dp/) into an expanded DwC-A directory.

Example usage:

```
./run.sh source-dp dest-dwca 'Dataset name'
```

`source-dp` should be a path to an extracted data package.  The DwC-A will be written to `dest-dwca`.  `'Dataset name'` is the title of the dataset.

Preliminary testing recommends a minimum of 4 GB to run this container, though large datasets may require more memory.

## Dockerfile

The [Dockerfile file](Dockerfile) creates an image trying to use binary packages whenever is possible, some source packages are installed by using the file [install_packages.R](R/install_packages.R)
Additionally, the file provides volume definitions for the input and output directories.

The image can be built using the [build.sh](build.sh) by simply running the script.
