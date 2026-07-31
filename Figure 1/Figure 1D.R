# 加载必要的包
library(ggplot2)
library(dplyr)

# 读取数据
data <- read.csv("Figure 1D new_species_stat.csv")

# 查看数据结构
head(data)

# 将Novelty列转换为因子，并指定顺序（确保堆叠顺序一致）
data$Novelty <- factor(data$Novelty, levels = c("Known", "BSpecies"))

# 绘制堆叠柱状图

pdf("Figure 1D new_species.pdf",width = 6,height = 6)
p<-ggplot(data, aes(x = Echo, y = Number, fill = Novelty)) +
  geom_col(position = "stack") +
  labs(
    title = "Number of Known and Novel Species by Environment",
    x = "Environment",
    y = "Number of Species",
    fill = "Species Type"
  ) +
  scale_fill_manual(
    values = c("Known" = "steelblue", "BSpecies" = "orange"),
    labels = c("Known", "Novel (BSpecies)")
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  )
 p
dev.off()