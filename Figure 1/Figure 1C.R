# 加载必要的包
library(ggplot2)
library(dplyr)

# 读取数据
data <- read.csv("Figure 1C structure_stat.csv")

# 查看数据结构
head(data)

# 将Confidence列转换为因子，并指定顺序（确保堆叠顺序一致）
data$Confidence <- factor(data$Confidence, levels = c("HC", "GC", "LC"))

# 将Echo列转换为因子，保持原始顺序或按需要排序
# 如果需要按特定顺序排列Echo，可以手动指定水平
# 例如：data$Echo <- factor(data$Echo, levels = c("EB000001", "EB000002", "EB000003", "EB000004", "EB000005"))

# 绘制堆叠柱状图
pdf("Figure 1C structure_stat.pdf",width = 6,height = 6)
p<-ggplot(data, aes(x = Echo, y = Number, fill = Confidence)) +
  geom_col(position = "stack") +
  labs(
    title = "Number of Structures by Confidence Level",
    x = "Structure ID",
    y = "Number of Structures",
    fill = "Confidence Level"
  ) +
  scale_fill_manual(
    values = c("HC" = "#1f77b4", "GC" = "#ff7f0e", "LC" = "#2ca02c"),
    labels = c("High Confidence (HC)", "Good Confidence (GC)", "Low Confidence (LC)")
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  ) 
  #+
  # 添加数值标签（可选）
 # geom_text(aes(label = Number), position = position_stack(vjust = 0.5), size = 3, color = "white")
p
dev.off()