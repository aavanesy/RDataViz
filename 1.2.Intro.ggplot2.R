
# Introduction to Syntax

# ggplot2 is based on the Grammar of Graphics, which means you build plots by adding layers to a base plot.
# The basic structure of a ggplot2 plot is:

ggplot(data = '<DATA>') +
  '<GEOM_FUNCTION>'(mapping = aes('<MAPPINGS>')) + 
  theme(...) + 
  custom_fun(...)

?ggplot
?geom_point
?geom_line
?geom_col
?geom_

