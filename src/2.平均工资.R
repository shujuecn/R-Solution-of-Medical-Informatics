library(tidyverse)

df = rio::import("./data/2.平均工资.xlsx")
df

result = df %>%
  group_by(`性别`, `职称`) %>%
  summarise(
    `人数` = n(),
    `平均工资` = str_c(round(mean(`工资`)), "元"),
    .groups = "drop"
  )
result

rio::export(result, "./output/2.平均工资.xlsx")
