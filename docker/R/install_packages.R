install.packages(c("jqr","leaflet", "EML", "emld","frictionless", "readr", "emld", "viridis", "vroom","rmarkdown", "jsonld","ggplot2","tidyselect","leaflet.providers","purrr","evaluate","curl","isoband","lifecycle"),
                 dependencies = TRUE, libs_only= TRUE)
remotes::install_github("inbo/camtraptor", build_vignettes = FALSE, build_manual = FALSE)