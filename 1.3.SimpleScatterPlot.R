
data_long <- read.csv('data/data_long.csv') %>% 
  mutate(Date = as.Date(Date))

# Let’s start with a simple scatter plot for direct sales

data_direct <- data_long %>% 
  filter(name == 'Direct')

# simple plot
ggplot(data = data_direct) + 
  geom_point(mapping = aes(x = Date, y = Sale))


#custom plot -- very important!
# color or size within aes or outsite of aes
ggplot(data = data_direct) + 
  geom_point(mapping = aes(x = Date, y = Sale),
             color = 'steelblue', size = 2, shape = 8, stroke = 1)

# save as R object

plot.dots <- ggplot(data = data_direct) + 
  geom_point(mapping = aes(x = Date, y = Sale),
             color = 'steelblue', size = 2, shape = 8, stroke = 1)

class(plot.dots)
str(plot.dots)

save(plot.dots, file = 'plotdots.Rdata')
