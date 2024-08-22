
data_long <- read.csv('data/data_long.csv') %>% 
  mutate(Date = as.Date(Date))
# Cumulate Sales
data_long_sales <- data_long %>% 
  arrange(Type)

data_long_sales <- data_long %>% 
  arrange(Type) %>% 
  group_by(Type) %>% 
  mutate(Cumulative_Sale = cumsum(Sale))

## custom colors
plot_lines <- ggplot(data = data_long_sales) + 
  geom_line(mapping = aes(x = Date, y = Cumulative_Sale, color = Type, linetype = Type),
            size = 1.5) + 
  theme(legend.position = "bottom") + 
  scale_color_manual(values = c("Direct" = "steelblue", 
                                "Affiliate" = "grey",
                                "Promotion" = "#86292C"))

plot_lines

# minor customization
plot_lines +
  theme(legend.title=element_blank())

# title, subtitle, axis labels
plot_lines2 <- plot_lines +
  theme(legend.title=element_blank()) + 
  labs(title = "Cumulative Sales by Source",
       subtitle = 'Annual Report as of February 2025',
       x = NULL,
       y = "Cumulative Sale") 

plot_lines2

# combine geoms
plot_lines2 + 
  geom_point(mapping = aes(x = Date, y = Cumulative_Sale), color = 'black', size = 0.5)

