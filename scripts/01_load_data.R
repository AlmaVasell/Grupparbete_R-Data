#################################################
# Syfte:
# Detta skript används för att skapa en första förståelse av datasetet,
# identifiera datatyper, saknade värden samt upptäcka eventuella
# inkonsekvenser i kategoriska variabler.
#################################################

# Laddar paket för datahantering
library(tidyverse)

# Läser in datasetet
data_raw <- read.csv("data/ecommerce_orders.csv")

# Översikt av datan (struktur och sammanfattning)
view(data_raw)
glimpse(data_raw)
summary(data_raw)

# Antal saknade värden per kolumn
colSums(is.na(data_raw))

# Kategoriska variabler att undersöka
cols <- c("customer_segment", "customer_type", "region", "city", "product_category", "product_subcategory","payment_method","campaign_source")

# Unika värden per kolumn (identifiera kategorier och problem)
for (col in cols) {
  cat("\n---", col, "---\n")
  print(unique(data_raw[[col]]))
}

# Sorterade värden (upptäcka dubbletter p.g.a. stavning/mellanslag)
sort(unique(data_raw$city))
sort(unique(data_raw$payment_method))
sort(unique(data_raw$campaign_source))
