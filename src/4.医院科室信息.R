library(tidyverse)

# 4-1 ----
df1 = rio::import("./data/4-1.医院科室信息.xlsx")
df1

result1 = df1 %>%
  pivot_wider(names_from = `职称`, values_from = `人数`, values_fill = 0)
result

rio::export(result1, "./output/4-1.医院科室信息.xlsx")

# 4-2 ----
df2 = rio::import("./data/4-2.医院费用统计.xlsx")
df2

result2 = df2 %>%
  pivot_longer(-`部门`, names_to = "费用类别", values_to = "金额")
result2

rio::export(result2, "./output/4-2.医院费用统计.xlsx")
