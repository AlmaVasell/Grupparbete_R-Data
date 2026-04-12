source("scripts/02_clean_data.R")
library(tidyverse)

data_analysis <- data_clean %>%
  mutate(order_value = quantity * unit_price * (1 - discount_pct))

sales_by_category <- data_analysis %>%
  group_by(product_category) %>%
  summarise(
    total_sales = sum(order_value, na.rm = TRUE),
    avg_sales = mean(order_value, na.rm = TRUE),
    median_sales = median(order_value, na.rm = TRUE),
    n_orders = n()
  ) %>%
  arrange(desc(total_sales))

sales_by_category

# Visualiseringar
sales_by_category_viz <-  ggplot(sales_by_category, aes(x = reorder(product_category, total_sales), y = total_sales)) +
  geom_col(fill = "#0F4C5C") +
  coord_flip() +
  labs(
    title = "Total försäljning per produktkategori",
    x = "Produktkategori",
    y = "Total försäljning"
  )

sales_by_category_viz

orders_by_category_viz <- ggplot(sales_by_category, aes(x = reorder(product_category, n_orders), y = n_orders)) +
    geom_col(fill = "#0F4C5C") +
    coord_flip() +
    labs(
      title = "Antal ordrar per produktkategori",
      x = "Produktkategori",
      y = "Antal ordrar"
    )

orders_by_category_viz

  