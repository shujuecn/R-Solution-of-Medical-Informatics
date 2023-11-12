library(tidyverse)

# 8-1.合并多个医生（多个xlsx） ----

files = fs::dir_ls("./data/8.合并多个文件/8-1多个医生/", glob = "*.xlsx")
files

result = map_dfr(files, rio::import)
result$生日 = ymd(result$生日)

rio::export(result, "./output/8-1.多个医生.xlsx")


# 8-2.合并多个学生（多个xlsx 多个sheet）----

# 合并xlsx中的多个sheet
read_sheet = \(xlsx_path) {
  sheet_bind = map_dfr(
    readxl::excel_sheets(xlsx_path),
    ~ readxl::read_xlsx(xlsx_path, sheet = .x)
  )
  return(sheet_bind)
}

# 待合并的xlsx文件
xlsx_files = fs::dir_ls("./data/8.合并多个文件/8-2多个学生/", glob = "*.xlsx")

result = map_dfr(xlsx_files, read_sheet)
result$生日 = ymd(result$生日)

rio::export(result, "./output/8-2.多个学生.xlsx")
