library(tidyverse)

df = rio::import("./data/5.多级表头.xlsx")

result = df %>%
  t() %>%
  as_tibble() %>%
  slice(-1) %>%
  mutate(across(-c(`1`, `2`), as.numeric)) %>%
  group_by(`2`) %>%
  summarise(num = sum(across(where(is.numeric)))) %>%
  set_names("职称", "职称人数")
result

rio::export(result, "./output/5.多级表头.xlsx")
