library(tidyverse)
source("scripts/02_clean_data.R")

#Räknar antal,genomsnitt och median
#Beräknar hur stort varje segment är
#Sorterar efter högst värde
data_clean_customer_segment <- data_clean %>%
  group_by(customer_segment) %>% 
  summarise(
    count = n (),
    avg_order_value = mean(order_value_net,na.rm = TRUE),
    median = median(order_value_net,na.rm = TRUE)
  ) %>% mutate(share = count/ sum(count)) %>%
  arrange(desc(avg_order_value))


#Här hämtar jag in de genomsnittliga ordervärdena för segment
sb <- data_clean_customer_segment$avg_order_value[1]
consumer <- data_clean_customer_segment$avg_order_value[2]
corporate <- data_clean_customer_segment$avg_order_value[3]

#Här räknar jag ut den procentuella skillnaden mellan segment

(sb / corporate - 1) * 100      # Small Business vs Corporate
(consumer / corporate - 1) * 100 # Consumer vs Corporate
(sb / consumer - 1) * 100       # Small Business vs Consumer



#Skapar stapeldiagram över ordervärde per kundsegment
#Sorterar segmenten från lägst till högst
order_value_by_segment_viz <- ggplot(data_clean_customer_segment,
       aes(x = reorder(customer_segment, avg_order_value),
           y = avg_order_value,
           fill = customer_segment)) +
  geom_col() +
  labs(
    title = "Genomsnittligt ordervärde per kundsegment",
    x = "Kundsegment",
    y = "Genomsnittligt ordervärde"
  ) +
  theme_minimal()
  
order_value_by_segment_viz




