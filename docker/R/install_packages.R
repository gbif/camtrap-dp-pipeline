required_version <- "0.5.0"

# Install camtrapdp from r-universe
install.packages(
  "camtrapdp",
  repos = c("https://inbo.r-universe.dev", "https://cloud.r-project.org")
)

installed_version <- as.character(packageVersion("camtrapdp"))
if (installed_version != required_version) {
  stop(sprintf(
    "Expected camtrapdp %s but r-universe/CRAN installed %s. Aborting build.",
    required_version, installed_version
  ))
}

if (!library("camtrapdp", character.only = TRUE, logical.return = TRUE)) {
  quit(status = 1, save = "no")
}