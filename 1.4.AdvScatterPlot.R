
data_long <- read.csv('data/data_long.csv') %>% 
  mutate(Date = as.Date(Date))

# Introducing multiple dimensions >
# x axis, y axis and different data in the plot

# (color = Type) is OUTSIDE the aes !!!!
ggplot(data = data_long) + 
  geom_point(mapping = aes(x = Date, y = Sale), color = 'orange')


# (color = Type) is WITHIN the aes !!!!
ggplot(data = data_long) + 
  geom_point(mapping = aes(x = Date, y = Sale, color = Type))

ggplot(data = data_long) + 
  geom_point(mapping = aes(x = Date, y = Sale, shape = Type))

ggplot(data = data_long) + 
  geom_point(mapping = aes(x = Date, y = Sale, color = Type, shape = Type))
