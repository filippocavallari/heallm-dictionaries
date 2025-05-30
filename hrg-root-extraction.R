library(tidyverse)
library(readxl)
library(glue)
library(fs)

format_academic_year <- function(.year) {
  next_year_suffix <- str_sub(.year + 1, start = 3)
  
  str_c(.year, "-", next_year_suffix, sep = "")
}

# map_chr(2009:2025, format_academic_year)

format_path <- function(.year) {
  ext <- if_else(.year < 2013, "xls", "xlsx")
  
  glue("input/HRG4_{format_academic_year(.year)}_payment.{ext}")
}

# map_chr(2009:2025, format_path) |>
#   map_lgl(file.exists)

hrg_root_sheet <- function(.year) {
  format_path(.year) |>
    excel_sheets() |>
    keep(\(x) str_detect(x, "(?<!Intro to )Group (T|t)o Split"))
}

hrg_chapter_sheet <- function(.year) {
  format_path(.year) |>
    excel_sheets() |>
    keep(\(x) str_detect(x, "(?<!Sub)Chapter"))
}
# map_chr(2009:2025, hrg_root_sheet)

read_hrg4 <- function(.year, .sheet) {
  path <- format_path(.year)
  
  sheet <- if (.sheet == "root")
    hrg_root_sheet(.year)
  else
    sheet <- hrg_chapter_sheet(.year)
  
  if (.year < 2013) {
    read_xls(path, sheet)
  } else {
    read_xlsx(path, sheet)
  }
}

# map(2009:2025, read_hrg4_code_to_group)


clean_hrg4 <- function(.data, .type = c("root", "chapter")) {
  .type <- match.arg(.type)
  
  if (.type == "root") {
    .data |>
      select(hrg_root = `HRG Root`,
             hrg_root_description = `HRG Root Description`)
  } else {
    .data |>
      select(hrg_chapter = `HRG Chapter`,
             hrg_chapter_description = `HRG Chapter Description`)
  }
}

write_hrg4 <- function(.year, .type = c("root", "chapter")) {
  .type <- match.arg(.type)
  
  output_dir <- glue("hrg-{.type}-dictionaries")
  
  if(!dir_exists(output_dir)) {
    dir_create(output_dir)
  }
  
  output_path <- 
    glue("{output_dir}/hrg-{.type}-{format_academic_year(.year)}.csv")
  
  data <- read_hrg4(.year, .type)
  
  cleaned <- clean_hrg4(data, .type)
  
  write_csv(cleaned, output_path)
}

walk(2009:2025, \(year) write_hrg4(year, .type = "root"))
walk(2009:2021, \(year) write_hrg4(year, .type = "chapter"))