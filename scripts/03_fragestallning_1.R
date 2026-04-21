source("scripts/01_load_data.R")
source("scripts/02_clean_data.R")

library(tidyverse)

data_analysis <- data_clean

sales_by_category <- data_analysis %>%
  group_by(product_category) %>%
  summarise(
    total_sales = sum(order_value_net, na.rm = TRUE),
    avg_sales = mean(order_value_net, na.rm = TRUE),
    median_sales = median(order_value_net, na.rm = TRUE),
    n_orders = n()
  ) %>%
  arrange(desc(total_sales))

sales_by_category

# Visualisering 1: Total försäljning

ggplot(sales_by_category, aes(x = reorder(product_category, total_sales), y = total_sales)) +
  geom_col(fill = "#0F4C5C") +
  coord_flip() +
  labs(
    title = "Total försäljning per produktkategori",
    x = "Produktkategori",
    y = "Total försäljning"
  )


# Visualisering 2: Antal ordrar

ggplot(sales_by_category, aes(x = reorder(product_category, n_orders), y = n_orders)) +
  geom_col(fill = "#0F4C5C") +
  coord_flip() +
  labs(
    title = "Antal ordrar per produktkategori",
    x = "Produktkategori",
    y = "Antal ordrar"
  )