# Vilka produktkategorier har högst försäljning hos de olika kundsegmenten?
source("scripts/02_clean_data.R")
library(tidyverse)

# Summering av försäljning per produktkategori och kundsegment
sales_summary_04 <- data_clean %>%
  group_by(product_category, customer_segment)%>%
  summarise(
    total_rev = sum(order_value_net, na.rm=TRUE),
    num_orders = n(),
    avg_order = mean(order_value_net, na.rm=TRUE),
    mdn_order = median(order_value_net, na.rm=TRUE),
    .groups = "drop"
  ) %>%
  arrange(customer_segment, desc(total_rev))

# Visualisering - total försäljning per kundsegment (sekundär)
total_sales_viz_stacked <- ggplot(sales_summary_04, aes(x=customer_segment, y=total_rev, fill=product_category)) +
  geom_col(position = "stack") +
  labs(
    title = "Total försäljning per produktkategori och kundsegment",
    x = "Kundsegment",
    y = "Total nettoförsäljning",
    fill = "Produktkategori"
  )

total_sales_viz_stacked

# Visualisering - andel av försäljning per kundsegment (primär)
total_sales_viz <- ggplot(sales_summary_04, aes(x=customer_segment, y=total_rev, fill=product_category)) +
  geom_col(position = "fill") +
  labs(
    title = "Andel av försäljning per produktkategori och kundsegment",
    x = "Kundsegment",
    y = "Andel av total försäljning",
    fill = "Produktkategori"
  )

total_sales_viz

# Visar resultat
print(sales_summary_04)
