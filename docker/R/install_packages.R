# Install camtrapdp from CRAN
#install.packages("camtrapdp")

# Install camtraptdp  from GitHub
install.packages("devtools")
devtools::install_github("inbo/camtrapdp", ref = "refs/tags/v0.3.0")
if (!library("camtrapdp", character.only = TRUE, logical.return = TRUE)) {
  quit(status = 1, save = "no")
}
