library(ggplot2)


df <- read.table("drep_mags_Archaea.txt", header = TRUE, sep = "\t")


phylum_levels <- c("others", sort(setdiff(unique(df$phylum), "others")))
df$phylum <- factor(df$phylum, levels = phylum_levels)


ggplot(df, aes(x = biome, y = num, fill = phylum)) +
  geom_col(width = 0.65) +
  scale_y_continuous(limits = c(0, 100.01), breaks = seq(0, 100, 25), expand = c(0, 0)) +
  labs(title = "Archaea", x = "Biome", y = "Percentage(%)", fill = "phylum") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.title.x = element_text(face = "bold", size = 12, margin = margin(t = 8)),
    axis.line = element_line(color = "black", linewidth = 0.8),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.5)
  )
