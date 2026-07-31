library(ggplot2)

df <- read.table("Figure 1E all_mags_Bacteria.txt", header = TRUE, sep = "\t")    ###Figure 1F input file: Figure 1F all_mags_Archaea.txt


phylum_levels <- c("others", sort(setdiff(unique(df$phylum), "others")))
df$phylum <- factor(df$phylum, levels = phylum_levels)
df$biome <- factor(df$biome, levels = c("Thermal", "Cryogenic", "Acidic", "Saline", "Hyperbaric"))

pdf("Figure 1E Taxonomic_breakdown.pdf",width = 6,height = 6)       ####Figure 1F, pdf("Figure 1F Taxonomic_breakdown.pdf",width = 6,height = 6)
p <- ggplot(df, aes(x = biome, y = num, fill = phylum)) +
  geom_col(width = 0.65) +
  scale_y_continuous(limits = c(0, 100.01), breaks = seq(0, 100, 25), expand = c(0, 0)) +
  labs(title = "Bacteria", x = "Biome", y = "Percentage (%)", fill = "phylum") +        ####Figure 1F, labs(title = "Archaea", x = "Biome", y = "Percentage (%)", fill = "phylum")
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.title.x = element_text(face = "bold", size = 12, margin = margin(t = 8)),
    axis.line = element_line(color = "black", linewidth = 0.8),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color = "grey90", linewidth = 0.5)
  )
 p
 dev.off()
