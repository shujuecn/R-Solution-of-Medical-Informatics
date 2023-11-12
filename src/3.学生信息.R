library(tidyverse)

df = rio::import("./data/3.学生信息.xlsx")
df

result = df %>%
  mutate(
    `同学信息` = str_c(`姓名`, `民族`, `籍贯`, sep = ",")
  ) %>%
  group_by(`班级编号`, `性别`) %>%
  reframe(
    `计数` = n(),
    `同学信息` = str_c(`同学信息`, collapse = "; ")
  )
result

rio::export(result, "./output/3.学生信息.xlsx")
