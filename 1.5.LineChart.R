
data_long <- read.csv('data/data_long.csv') %>% 
  mutate(Date = as.Date(Date))


# Cumulate Sales
data_long_sales <- data_long %>% 
  arrange(Type)

data_long_sales <- data_long %>% 
  arrange(Type) %>% 
  group_by(Type) %>% 
  mutate(Cumulative_Sale = cumsum(Sale))

# Similar to geom_point syntax
# color here is adding the 3rd dimension
ggplot(data = data_long_sales) + 
  geom_line(mapping = aes(x = Date, y = Cumulative_Sale, color = Type))

## make the size a bit larger - size is OUTSIDE of aes()
ggplot(data = data_long_sales) + 
  geom_line(mapping = aes(x = Date, y = Cumulative_Sale, color = Type), size = 2)


# custom linetype (similar to shape for points)
ggplot(data = data_long_sales) + 
  geom_line(mapping = aes(x = Date, y = Cumulative_Sale, color = Type, linetype = Type),
            size = 2)

# legend position
ggplot(data = data_long_sales) + 
  geom_line(mapping = aes(x = Date, y = Cumulative_Sale, color = Type, linetype = Type),
            size = 1.5) + 
  theme(legend.position = "bottom")


