library(tidyverse)
library(readxl)

hrg_xlsx <- "input/hrg4-201819-reference-costs-grouper-code-to-group-v1.0.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`Core or Unbundled?`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |> 
  write_csv(file = "hrg-codes.csv")
  
