library(camtrapdp)

import_path <- "/R/dp"
export_path <- "/R/dwca"

#' Transforms the Camera Trap Data Package into DwC-A
#' 
#' @param dataset_title GBIF dataset title.
#' @get /to_dwca
convertCamtrapDwca <- function(dataset_title = "") {
  if (!file_test("-d", import_path)) {
    stop(paste("Input path does not exist", import_path))
  }

  if (!file_test("-d", export_path)) {
    stop(paste("Output path does not exist", export_path))
  }

  # Create the package object
  print(sprintf("Converting from %s to %s", import_path, export_path))
  package <- camtrapdp::read_camtrapdp(file = file.path(import_path, "datapackage.json"))
  package$title <- dataset_title

  # Create the dwc files
  unlink(export_path)
  camtrapdp::write_dwc(package, export_path)

  # Copy meta.xml, this is copied to the same directory where this script run in the docker image
  file.copy("meta.xml", file.path(export_path, "meta.xml"))

  # Flush memory
  gc()

  # Returns with a success message
  return(sprintf("Dataset transformed"))
}

args = commandArgs(trailingOnly = TRUE)

if (length(args) == 1) {
  convertCamtrapDwca(args[1])
} else {
  print("Need one arguments, dataset_title.")
}
