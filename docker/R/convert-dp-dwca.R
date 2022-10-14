library(dplyr)
library(EML)
library(camtraptor)

#* Transforms the CameraTrap Data Package into DwC-A.
#* @param dataset_key GBIF datset key
#* @param dataset_title GBIF dataset title
#* @get /to_dwca
convertCamtrapDwca <- function(import_path="", export_path="", dataset_key="", dataset_title="") {
  file_import_path <- file.path(import_path, dataset_key)
  file_export_path <- file.path(export_path, dataset_key)

  #Create the package object
  print(sprintf("Converting from %s to %s", file_import_path, file_export_path))
  package <- camtraptor::read_camtrap_dp(file.path(import_path, dataset_key))
  package$title <- dataset_title

  #create the dwc files
  unlink(file_export_path)
  write_dwc(package, file_export_path)

  #flush memory
  gc()

  #returns with a sucess message
  return(sprintf("Dataset %s transformed", dataset_key))
}

args = commandArgs(trailingOnly=TRUE)

if (length(args) == 4) {
  convertCamtrapDwca(args[1], args[2], args[3], args[4])
} else {
  print("Need four arguments, import_path, export_path, dataset_key, dataset_title.")
}
