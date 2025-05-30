library(tidyverse)
library(readxl)
library(glue)
library(fs)

# Format academic year as "YYYY-YY"
hrg_academic_year <- function(.year) {
  next_year_suffix <- str_sub(.year + 1, start = 3)
  glue("{.year}-{next_year_suffix}")
}

# Generate file path for a given year
hrg_path <- function(.year) {
  ext <- if_else(.year < 2013, "xls", "xlsx")
  glue("input/HRG4_{hrg_academic_year(.year)}_payment.{ext}")
}

# Get the relevant sheet name based on type
hrg_get_sheet <- function(.year, .type = c("root", "chapter")) {
  .type <- match.arg(.type)
  
  pattern <- if (.type == "root") {
    "(?<!Intro to )Group (T|t)o Split"
  } else {
    "(?<!Sub)Chapter"
  }
  
  hrg_path(.year) |>
    excel_sheets() |>
    keep(\(x) str_detect(x, pattern))
}

# Read HRG data from Excel
hrg_read <- function(.year, .type = c("root", "chapter")) {
  .type <- match.arg(.type)
  path <- hrg_path(.year)
  
  if (!file.exists(path)) {
    cli::cli_abort("File not found: {.file {path}}")
  }
  
  sheet <- hrg_get_sheet(.year, .type)
  
  if (length(sheet) != 1) {
    cli::cli_abort("Expected exactly one matching sheet for {.val {hrg_academic_year(.year)}}, found {length(sheet)}.")
  }
  
  if (.year < 2013) {
    read_xls(path, sheet)
  } else {
    read_xlsx(path, sheet)
  }
}

# Clean HRG data
hrg_clean <- function(.data, .type = c("root", "chapter")) {
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

# Write cleaned HRG data to CSV
hrg_write <- function(.year, .type = c("root", "chapter")) {
  .type <- match.arg(.type)
  
  cli::cli_inform("Processing {.strong {toupper(.type)}} dictionary for year {.val {hrg_academic_year(.year)}}")
  
  output_dir <- glue("hrg-{.type}-dictionaries")
  
  if (!dir_exists(output_dir)) {
    dir_create(output_dir)
  }
  
  output_path <- glue("{output_dir}/hrg-{.type}-{hrg_academic_year(.year)}.csv")
  
  data <- hrg_read(.year, .type)
  cleaned <- hrg_clean(data, .type)
  
  write_csv(cleaned, output_path)
  
  cli::cli_alert_success("Written to {.file {output_path}}")
}

# Run for all years
walk(2009:2025, \(year) hrg_write(year, .type = "root"))
walk(2009:2021, \(year) hrg_write(year, .type = "chapter"))
