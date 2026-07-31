library(ggalluvial)
library(ggplot2)

data <- read.table(file = "Figure 1H sanke_data.txt", sep = "\t", header = TRUE, check.names = FALSE)
# Data format transformation
df <- to_lodes_form(data, axes = seq_along(data), id = "value")

# 自定义配色方案，使用更现代的调色板，并控制色彩平衡
# Set color
colors <- colorRampPalette(c('#0ca9ce', '#78cfe5', '#c6ecf1', '#ff6f81', '#ff9c8f', '#ffc2c0','#d386bf',
        '#cdb1d2', '#fae6f0', '#eb6fa6', '#ff88b5', '#00b1a5',"#ffa68f","#ffca75","#97bc83","#acd295",
        "#00ada1","#009f93","#ace2da","#448c99","#00b3bc","#b8d8c9","#db888e","#e397a4","#ead0c7",
        "#8f9898","#bfcfcb"))(67)


# Plot
pdf("Figure 1H sanke.pdf",width = 7,height = 5)
p1 <- ggplot(df, aes(x = x, stratum = stratum, alluvium = value, fill = stratum, label = stratum)) +
  geom_flow(width = 0.15, curve_type = "cubic", alpha = 0.7, color = 'gray80', size = 0.2) +
  geom_stratum(width = 0.15, color = "gray90") +
  geom_text(stat = 'stratum', size = 3, color = 'gray30') +
  scale_fill_manual(values = colors) +
  theme_minimal() +
  theme(legend.position = 'right',
        guides(fill = guide_legend(ncol = 3)),
        axis.title = element_blank(),
        axis.text = element_blank(),
        panel.grid = element_blank(),
        plot.margin = margin(5, 5, 5, 5))

p1
dev.off()

