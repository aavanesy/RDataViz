
data_long <- read.csv('data/data_long.csv') %>% 
  mutate(Date = as.Date(Date))

monthly_sales <- data_long %>% 
  mutate(Date = format(Date, "%Y-%b")) %>% 
  mutate(Date = factor(Date, levels = unique(format(as.Date(data_long$Date), "%Y-%b")), ordered = TRUE)) %>%
  group_by(Date, Type) %>% 
  summarise(Sale = sum(Sale)) %>% 
  ungroup()


# plot a column chart 
ggplot(monthly_sales) + 
  geom_col(mapping = aes(x = Date, y = Sale, fill = Type))

# side by side
ggplot(monthly_sales) + 
  geom_col(mapping = aes(x = Date, y = Sale, fill = Type), position = "dodge") 

# customize more > introducing theme
ggplot(monthly_sales) + 
  geom_col(mapping = aes(x = Date, y = Sale, fill = Type),
           position = "dodge") +
  theme_minimal()

?theme_

# a bit more customization
col_plot <- ggplot(monthly_sales) + 
  geom_col(mapping = aes(x = Date, y = Sale, fill = Type),
           position = "dodge") +
  theme_minimal() + 
  labs(title = "Monthly Sales by Source",
       x = NULL,
       y = "Sale") +
  theme(legend.title=element_blank()) + 
  theme(legend.position = "bottom")

# change colors

col_plot2 <- col_plot + 
  scale_fill_manual(values = c("Direct" = "steelblue", 
                                "Affiliate" = "grey",
                                "Promotion" = "#86292C"))

save(col_plot2, file = 'col_plot2.Rdata')
