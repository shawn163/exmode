# 加载必要的包
library(ggplot2)
library(dplyr)


# 读取数据
data <- read.csv("Figure 1G BGC_stat.csv")

# 查看数据结构
head(data)

# 计算每个类别的总数，用于排序
class_totals <- data %>%
  group_by(Class) %>%
  summarise(total = sum(Number)) %>%
  arrange(desc(total))

# 将Class列转换为因子，并按总数降序排列
data$Class <- factor(data$Class, levels = class_totals$Class)

# 将Echo列转换为因子，保持原始顺序
data$Echo <- factor(data$Echo)

# 定义颜色方案（使用不同颜色区分各类别）
class_colors <- c(
  "RiPP" = "#07B0A4",
  "terpene" = "#D0A893",
  "PKS" = "#5CA2AA",
  "NRPS" = "#FB84B2",
  "other" = "#C191B1",
  "saccharide" = "#6CAC9B"
)

# 绘制堆叠柱状图
pdf("Figure 1G BGC_stat.pdf",width = 6,height = 6)
p<-ggplot(data, aes(x = Echo, y = Number, fill = Class)) +
  geom_col(position = "stack") +
  labs(
    title = "Number of Biosynthetic Gene Clusters (BGCs) by Class",
    x = "Sample ID",
    y = "Number of BGCs",
    fill = "BGC Class"
  ) +
  scale_fill_manual(values = class_colors) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    legend.position = "right",
    legend.title = element_text(face = "bold")
  ) +
  # 使用科学计数法格式化y轴，因为数值较大
  scale_y_continuous(labels = scales::comma)
p
dev.off()
