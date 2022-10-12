library(plumber)

pr("dp_dwca.R") %>%
  pr_run(host="0.0.0.0", port=8000)