library(tidyverse)
library(readxl)
library(glue)

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
  
  if (.sheet == "root"){
    sheet <- hrg_root_sheet(.year)
  } else {
    sheet <- hrg_chapter_sheet(.year)
  }
  
  if (.year < 2013) {
    read_xls(path, sheet)
  } else {
    read_xlsx(path, sheet)
  }
}

# map(2009:2025, read_hrg4_code_to_group)

clean_hrg4_root <- function(.data) {
  .data |>
    select(hrg_root = `HRG Root`,
           hrg_root_description = `HRG Root Description`)
}

clean_hrg4_chapter <- function(.data) {
  .data |>
    select(hrg_chapter = `HRG Chapter`,
           hrg_chapter_description = `HRG Chapter Description`)
}

write_hrg4_root <- function(.year) {
  output_dir <- "hrg-root-dictionaries"
  
  if(!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  output_path <-
    str_c(output_dir, "/hrg-root-", format_academic_year(.year), ".csv")
  
  read_hrg4(.year, "root") |>
    clean_hrg4_root() |>
    write_csv(file = output_path)
}

write_hrg4_chapter <- function(.year) {
  output_dir <- "hrg-chapter-dictionaries"
  
  if(!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  output_path <-
    str_c(output_dir, "/hrg-chapter-", format_academic_year(.year), ".csv")
  
  read_hrg4(.year, "chapter") |>
    clean_hrg4_chapter() |>
    write_csv(file = output_path)
}

walk(2009:2025, write_hrg4_root)
walk(2009:2021, write_hrg4_chapter)
