# 加载必要的包
library(ggplot2)
library(dplyr)

# 读取数据
data <- read.csv("Figure S1 stru2unigenes.csv")

# 查看数据结构
head(data)

# 将Novelty列转换为因子，并指定顺序（确保堆叠顺序一致）
data$Rep <- factor(data$Rep, levels = c( "Unrepresented","Represented"))
data$Echo <- factor(data$Echo, levels = c("Thermal", "Cryogenic", "Acidic", "Saline", "Hyperbaric"))

# 绘制堆叠柱状图

pdf("Figure S1 stru2unigenes1.pdf",width = 6,height = 6)
p<-ggplot(data, aes(x = Echo, y = Number, fill = Rep)) +
  geom_col(position = "stack") +
  labs(
    x = "Environment",
    y = "Number of proteins",
    fill = "Species Type"
  ) +
  scale_fill_manual(
    values = c("Represented" = "steelblue", "Unrepresented" = "orange"),
    labels = c("Represented", "Unrepresented")
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  )
 p
dev.off()