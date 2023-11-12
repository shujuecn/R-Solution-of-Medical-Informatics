library(tidyverse)

df = rio::import("./data/1.中药处方组成.xlsx")
df

# 方法1 ----
result = df %>%
  separate_rows(`处方组成`, sep = ",") %>%
  separate(`处方组成`, into = c("中药名", "剂量"), sep = ":")
result

rio::export(result, "./output/1.中药处方组成.xlsx")


# 方法2 ----
max_col = max(str_count(df$处方组成, ",")) + 1
df %>%
  separate(`处方组成`, letters[1:max_col], sep = ",") %>%
  pivot_longer(-`方名`, names_to = NULL) %>%
  separate(`value`, into = c("中药名", "剂量"), sep = ":") %>%
  filter(!is.na(`中药名`))

result %>%
  group_by(方名) %>%
  sample_n(2, replace = TRUE)
