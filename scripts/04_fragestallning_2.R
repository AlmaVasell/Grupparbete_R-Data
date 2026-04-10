library(tidyverse)
source("scripts/02_clean_data.R")
#Delar upp datan i de olika segmenten
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

#Här räknar jag skillnader mellan de olika segmenten i %
data_clean_customer_segment %>%
  mutate(
    pct_diff = (avg_order_value / min(avg_order_value) - 1) * 100
  )

#Skapar stapeldiagram över ordervärde per kundsegment
#Sorterar segmenten från lägst till högst
ggplot(data_clean_customer_segment,
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

#Grafen visar att ordervärdet skiljer sig mellan kundsegmenten, där vissa
#segment har högre genomsnittliga köp än andra. Detta indikerar att
#kundsegment påverkar hur mycket kunder handlar för

#Vi kan även konstatera att Small Business har högst order värde och ligger
#cirka 47% över Corporate medan Consumer ligger på 37% över. Detta visar på
#att skillnader mellan kundsegmenten är tydliga och att vissa segment tenderar
#att göra större köp. Vi bör även ha i åtanke att det finns 529 observationer
#på Consumer, 302 för Small Business och 169 för Corporate.

  





