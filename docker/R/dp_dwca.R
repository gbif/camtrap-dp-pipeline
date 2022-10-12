library(dplyr)
library(EML)
library(camtraptor)

import_path <- "/usr/local/gbif/camtrap-dp/dwca"
export_path <- "/usr/local/gbif/camtrap-dp/dp"

#* Transforms the CameraTrap Data Package into DwC-A.
#* @param dataset_key GBIF datset key
#* @param dataset_title GBIF dataset title
#* @get /to_dwca
function(dataset_key="", dataset_title="") {
  #Create the package object
  package <- camtraptor::read_camtrap_dp(file.path(import_path, dataset_key))
  package$title <- dataset_title

  #create the dwc files
  file_export_path <- file.path(export_path, dataset_key)
  unlink(file_export_path)
  write_dwc(package, file_export_path)

  #flush memory
  gc()

  #returns with a sucess message
  return(sprintf("Dataset %s transformed", dataset_key))
}


#* Echo back the input
#* @param msg The message to echo
#* @get /ping
function(msg="") {
  list(msg = sprintf("%s Pong!", msg))
}