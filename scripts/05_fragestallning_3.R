#Finns det ett samband mellan rabatt och ordervärde?
source("scripts/02_clean_data.R")
library(tidyverse)

#Summering av ordervärde och rabatt
AOV_summary <- data_clean |>
  summarise(
    Order_count = n(),
    Average_order_value = mean(order_value_net, na.rm = TRUE),
    Median_order_value = median(order_value_net, na.rm = TRUE),
    Max_order_value = max(order_value_net, na.rm = TRUE),
    Average_discount = mean(discount_pct, na.rm = TRUE),
    Median_discount = median(discount_pct, na.rm = TRUE),
    Max_discount = max(discount_pct, na.rm = TRUE)
  )
AOV_summary

#Visualisering, samband mellan Ordervärde och Rabatt
AOV_discount_viz <- ggplot(
  data_clean, aes(x = order_value_net, y = discount_pct * 100)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    title = "Samband mellan ordervärde och rabattsats",
    x = "Ordervärde (order_value_net)",
    y = "Rabatt i procent (discount_pct)"
  )

AOV_discount_viz



