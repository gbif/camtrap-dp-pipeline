library(dplyr)
library(EML)
library(camtraptor)
library(logger)
library(here)

export_path <- "/usr/local/gbif/camtrap-dp/dwca"
import_path <- "/usr/local/gbif/camtrap-dp/dp"
logs_path <- "/usr/local/gbif/camtrap-dp/logs"

#Logger setup
if (!fs::dir_exists(logs_path)) fs::dir_create(logs_path)
log_appender(appender_file(tempfile("camtraptor_", logs_path, ".log")))

#* Transforms the CameraTrap Data Package into DwC-A.
#* @param dataset_key GBIF datset key
#* @param dataset_title GBIF dataset title
#* @get /to_dwca
function(dataset_key="", dataset_title="") {
  tryCatch(expr = {#Create the package object
                   file_path <- file.path(import_path, dataset_key, "datapackage.json")
                   if (!file_test("-f", file_path)) {
                    stop(paste("Input path does not exist", file_path))
                   }
                   package <- camtraptor::read_camtrap_dp(file = file_path)
                   package$title <- dataset_title

                   #create the dwc files
                   file_export_path <- file.path(export_path, dataset_key)
                   unlink(file_export_path)
                   write_dwc(package, file_export_path)

                   #copy meta.xml, this copied to the same directory where this script run in the docker image
                   file.copy(here("meta.xml"), file.path(file_export_path, "meta.xml"))

                   #flush memory
                   gc()

                   #returns with a sucess message
                   log_info(skip_formatter(sprintf("Dataset %s transformed", dataset_key)))
                   return(sprintf("Dataset %s transformed", dataset_key))
         },
         error = function(e){
           log_error(paste("Error processing dataset", dataset_key, e))
           e
         })
}


#* Echo back the input
#* @param msg The message to echo
#* @get /ping
function(msg="") {
  list(msg = sprintf("%s Pong!", msg))
}