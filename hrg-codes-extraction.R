library(tidyverse)
library(readxl)

# hrg_xlsx <- "input/hrg4-201819-reference-costs-grouper-code-to-group-v1.0.xlsx"
# 
# read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
#   select(-`Core or Unbundled?`) |>
#   rename(hrg_code = HRG,
#          hrg_description = `HRG Description - Including Split`) |> 
#   write_csv(file = "hrg-codes.csv")

# 2009-2010
hrg_xlsx <- "input/HRG4_2009-10.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Labels") |>
  select(-`HRG Core (C) and Unbundled (U)`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Label - Including Split`) |> 
  write_csv(file = "hrg-codes-09-10.csv")

# 2010-2011
hrg_xlsx <- "input/HRG4_2010-11.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Labels") |>
  select(-`HRG Core (C) and Unbundled (U)`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Label - Including Split`) |> 
  write_csv(file = "hrg-codes-10-11.csv")

# 2011-2012
hrg_xlsx <- "input/HRG4_2011-12.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Labels") |>
  select(-`HRG Core (C) and Unbundled (U)`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Label - Including Split`) |> 
  write_csv(file = "hrg-codes-11-12.csv")

# 2012-2013
hrg_xlsx <- "input/HRG4_2012-13.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`HRG Core (C) and Unbundled (U)`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Label - Including Split`) |>
  write_csv(file = "hrg-codes-12-13.csv")

# 2013-2014
hrg_xlsx <- "input/HRG4_2013-14.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`HRG Core (C) and Unbundled (U)`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |>
  write_csv(file = "hrg-codes-13-14.csv")

# 2014-2015
hrg_xlsx <- "input/HRG4_2014-15.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`Core or Unbundled?`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |>
  write_csv(file = "hrg-codes-14-15.csv")

# 2015-2016
hrg_xlsx <- "input/HRG4_2015-16.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`Core or Unbundled?`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |>
  write_csv(file = "hrg-codes-15-16.csv")

# 2016-2017
hrg_xlsx <- "input/HRG4_2016-17.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`Core or Unbundled?`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |>
  write_csv(file = "hrg-codes-16-17.csv")

# 2018-2019
hrg_xlsx <- "input/HRG4_2018-19.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "HRG") |>
  select(-`Core or Unbundled?`) |>
  rename(hrg_code = HRG,
         hrg_description = `HRG Description - Including Split`) |>
  write_csv(file = "hrg-codes-18-19.csv")

