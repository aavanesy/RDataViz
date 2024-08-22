
## Install Packages
pkgs <- c('ggplot2', 'tibble', 'dplyr', 'tidyr')
install.packages(pkgs)


## Load Packages
library(ggplot2)
library(tibble)
library(dplyr)
library(tidyr)

# optional
library(tidyverse)

#extra
library(plotly)

## version control option ----

repo_date <- 'https://packagemanager.posit.co/cran/2023-06-30'

install.packages(pkgs, repos = repo_date)