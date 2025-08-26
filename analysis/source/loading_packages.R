# loading required packages for generating summary stats for serological data presented in Werner et al., 2025.

# needed package names
packages <- c("knitr", "rstatix", "scales", "tidyverse", "dplyr", "stringr", "rlang")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

invisible(lapply(packages, library, character.only = TRUE))

# file and chunk options using knitr.
knitr::opts_chunk$set(echo = FALSE)
knitr::opts_knit$set(root.dir = "./analysis") # setting working directory for all chunks


# reading in relevant data files.
data = read_csv("source/data.csv") # reading in mastersheet with data presented in Werner et al., 2025.
