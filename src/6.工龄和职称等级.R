library(tidyverse)

df = rio::import("./data/6.计算工龄和职称等级.xlsx")
df

result = df %>%
  mutate(
    `工龄` = year(today()) - year(`参加工作时间`),
    `工资` = round(`工资`),
    `职称等级` = fct_recode(`职称`,
      `中级` = "主治医师",
      `副高级` = "副主任医师",
      `正高级` = "主任医师"
    )
  ) %>%
  select(-c(`生日`, `参加工作时间`))
result

rio::export(result, "./output/6.计算工龄和职称等级.xlsx")
