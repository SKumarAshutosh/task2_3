# Load required packages
library(readr)
library(tidyverse)
library(stringr)
library(ggplot2)
library(dplyr)

# Define the file path
file_path <- "./Homo_sapiens.gene_info.gz"

# Read the gzipped .csv file into a DataFrame
data <- read_tsv(gzfile(file_path))

# Print the first few rows
head(data)

# Define the specific order of the chromosomes
chromosome_order <- c(as.character(1:22), "X", "Y", "MT", "Un")

# Filter out rows where 'chromosome' contains a '|' or '-' or is NA
df_filtered <- data %>% 
  filter(!grepl("\\||-|NA", chromosome))

# Set the factor levels of 'chromosome' to be in the specified order
df_filtered$chromosome <- factor(df_filtered$chromosome, levels = chromosome_order)

# Create the bar plot
p <- ggplot(df_filtered, aes(x = chromosome)) +
  geom_bar() +
  labs(x = "Chromosomes", y = "Gene count", title = "Number of genes in each chromosome") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

# Save the plot as a PDF file in your home directory
ggsave("./Gene_count.pdf", plot = p)

