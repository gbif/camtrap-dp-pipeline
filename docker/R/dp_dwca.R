library(dplyr)
library(here)
library(camtraptor)
library(EML)

import_path <- "/usr/local/gbif/camera-trap-dp/dp/"
export_path <- "/usr/local/gbif/camera-trap-dp/dp/"

#* Transforms the CameraTrap Data Package into DwC-A.
#* @param dataset_key GBIF datset key
#* @param dataset_title GBIF dataset title
#* @get /to_dwca
function(dataset_key="", dataset_title="") {
  package <- camtraptor::read_camtrap_dp(here::here(import_path, dataset_key))
  package$title <- dataset_title
  file_export_path <- here::here(export_path, dataset_key)
  unlink(file_export_path)
  write_dwc(package, file_export_path)
}


#* Echo back the input
#* @param msg The message to echo
#* @get /ping
function(msg="") {
  list(msg = paste0("Pong!"))
}