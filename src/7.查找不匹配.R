library(tidyverse)

file = "./data/7.查找不匹配.xlsx"
dfs = map(1:2, ~ rio::import(file, which = .x))

doctor_info = dfs[[1]]
further_study = dfs[[2]]

result = doctor_info %>%
  anti_join(further_study, by = "证件号")

result

rio::export(result, "./output/7.查找不匹配.xlsx")
