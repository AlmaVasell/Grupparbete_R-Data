source("scripts/01_load_data.R")
library(tidyverse)

unique(data_raw$returned)

data_clean <- data_raw %>%
  mutate(
    # Ändra datatyper
    returned = recode(returned, "Yes" = TRUE, "No" = FALSE),
    order_date = as.Date(order_date),
    
    # Hantera saknade värden
    discount_pct = ifelse(is.na(discount_pct), 0, discount_pct),
    city = na_if(city, ""),
    payment_method = na_if(payment_method, ""),
    campaign_source = na_if(campaign_source, ""),
    
    # Standardisera text
    city = str_to_title(str_trim(city)),
    payment_method = str_to_title(str_trim(payment_method)),
    campaign_source = str_to_title(str_trim(campaign_source)),
    
    # Nya variabler
    order_value = quantity * unit_price,
    price_after_discount = unit_price * (1 - discount_pct),
    order_value_net = quantity * price_after_discount,
    
    discount_group = case_when(
      discount_pct == 0 ~ "Ingen rabatt",
      discount_pct < 0.1 ~ "Låg",
      discount_pct < 0.3 ~ "Medium",
      TRUE ~ "Hög"
    ),
    
    delivery_category = ifelse(shipping_days <= 2, "Snabb", "Långsam"),
    
    order_month = format(order_date, "%Y-%m")
  )

glimpse(data_clean)
summary(data_clean)