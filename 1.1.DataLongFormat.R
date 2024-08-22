library(tidyverse)

## Dummy data -- WIDE Format

start_date = as.Date('2024-01-01')
end_date = as.Date('2024-12-31')
nsales = 100
price_range = 20:200 / 10

data_wide <- tibble(
  Date = sample(seq(start_date, end_date, by = 1), nsales, replace = F),
  Direct = sample(price_range, nsales, replace = T),
  Affiliate = sample(price_range, nsales, replace = T),
  Promotion = sample(price_range, nsales, replace = T)
) %>% 
  arrange(Date)

write.csv(data_wide, file = 'data/data_wide.csv')

## Converting to LONG Format
?tidyr::pivot_longer

data_long <- data_wide %>% 
  pivot_longer(cols = -c('Date')) %>% 
  rename(Sale = value, Type = name)

data_long <- data_wide %>% 
  pivot_longer(cols = -c(1)) %>% 
  rename(Sale = value, Type = name)


write.csv(data_long, file = 'data/data_long.csv')

## Advanced pivoting ----

shops = c('Amazon', 'Wallmart', 'Costco')

data_wide2 <- tibble(
  Date = sample(seq(start_date, end_date, by = 1), nsales, replace = T),
  Shop = sample(shops, nsales, replace = T),
  Direct = sample(price_range, nsales, replace = T),
  Affiliate = sample(price_range, nsales, replace = T),
  Promotion = sample(price_range, nsales, replace = T)
) %>% 
  arrange(Date)

data_long2 <- data_wide2 %>% 
  pivot_longer(cols = -c(1:2))

