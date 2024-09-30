# Install camtrapdp from r-universe
install.packages(
  "camtrapdp",
  repos = c("https://inbo.r-universe.dev", "https://cloud.r-project.org")
)
if (!library("camtrapdp", character.only = TRUE, logical.return = TRUE)) {
  quit(status = 1, save = "no")
}
