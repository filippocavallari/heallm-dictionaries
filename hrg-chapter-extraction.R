library(tidyverse)
library(readxl)

# 2009-2010
hrg_xlsx <- "input/HRG4_2009-10.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-09-10.csv")

# 2010-2011
hrg_xlsx <- "input/HRG4_2010-11.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-10-11.csv")

# 2011-2012
hrg_xlsx <- "input/HRG4_2011-12.xls"

read_xls(path = hrg_xlsx, sheet = "HRG4 Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-11-12.csv")

# 2012-2013
hrg_xlsx <- "input/HRG4_2012-13.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-12-13.csv")

# 2013-2014
hrg_xlsx <- "input/HRG4_2013-14.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-13-14.csv")

# 2014-2015
hrg_xlsx <- "input/HRG4_2014-15.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-14-15.csv")

# 2015-2016
hrg_xlsx <- "input/HRG4_2015-16.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-15-16.csv")

# 2016-2017
hrg_xlsx <- "input/HRG4_2016-17.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-16-17.csv")

# 2018-2019
hrg_xlsx <- "input/HRG4_2018-19.xlsx"

read_xlsx(path = hrg_xlsx, sheet = "Chapter") |>
  rename(hrg_chapter = `HRG Chapter`,
         hrg_chapter_description = `HRG Chapter Description`) |> 
  write_csv(file = "hrg-chapter-18-19.csv")