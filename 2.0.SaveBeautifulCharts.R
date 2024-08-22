

?ggsave

load('col_plot2.Rdata')

file_output <- 'output/ColPlot.png'

ggsave(filename = file_output,
       col_plot2,
       width = 11.67, height = 8.27, 
       device='png', dpi=140)

ggsave(filename = file_output,
       col_plot2,
       width = 11.67,
       height = 8.27, 
       device='png', dpi=300)

