# Please set Working Directory as Appropriate:

# Data is imported into RStudio:
data <- read.csv('C:/Users/Shane/Desktop/Data Science and Analytics - Copy/Data Science and Analytics/Data Science Project/Data/RStudio Code/ProjectData.csv')
View(data)

# R Packages Installation & Library:install.packages("dplyr")
install.packages("ggpubr")
install.packages("caret")
install.packages("ggplot2")
library(ggplot2)
library(ggridges)
library(tidyverse)
library(ggpubr)
library(dplyr)
library(ggpubr)
library(caret)
library(scales)


# Data Cleaning:
" The ill animal was removed before importing the data into RStudio"
table(data$Animal)
"Each animal should have 3 observations (one for each sample). Due to an incorrect \n
technique for the first sample taken from the animal, the first entry is disregarded"
data <- data[-c(100),] 
"The animal column is removed as it is not necessary"
data <- subset(data, select = -c(1))

# Seperating into DEX & Control Groups:
table(data$DEX_Group)
dex <- subset(data, data$DEX_Group == "DEX")
control <- subset(data, data$DEX_Group == "CONTROL")

# Initial Visualiations:


# Changing Pen into Factor Variable:
data$Pen <- as.factor(data$Pen)

# Histograms of sampling rounds:
par(mfrow = c(1,1))
hist(dex$Firmicutes[dex$Sampling_Round=="R1"], xlim = c(0,0.5))
hist(dex$Firmicutes[dex$Sampling_Round=="R2"], xlim = c(0,0.5))
hist(dex$Firmicutes[dex$Sampling_Round=="R3"], xlim = c(0,0.5))

# T tests: Independent Samples:
# Shapiro Wilks Tests:

# Firmicutes:
shapiro.test(dex$Firmicutes[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Firmicutes[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Firmicutes[dex$Sampling_Round=="R3"] )

shapiro.test(control$Firmicutes[control$Sampling_Round=="R1"] )
shapiro.test(control$Firmicutes[control$Sampling_Round=="R2"] )
shapiro.test(control$Firmicutes[control$Sampling_Round=="R3"] )

# Bacteroidetes:
shapiro.test(dex$Bacteroidetes[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Bacteroidetes[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Bacteroidetes[dex$Sampling_Round=="R3"] )

shapiro.test(control$Bacteroidetes[control$Sampling_Round=="R1"] )
shapiro.test(control$Bacteroidetes[control$Sampling_Round=="R2"] )
shapiro.test(control$Bacteroidetes[control$Sampling_Round=="R3"] )

# Euryarchaeota
shapiro.test(control$Euryarchaeota[control$Sampling_Round=="R1"] )
shapiro.test(control$Euryarchaeota[control$Sampling_Round=="R2"] )
shapiro.test(control$Euryarchaeota[control$Sampling_Round=="R3"] )

shapiro.test(dex$Euryarchaeota[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Euryarchaeota[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Euryarchaeota[dex$Sampling_Round=="R3"] )

# Proteobacteria
shapiro.test(control$Proteobacteria[control$Sampling_Round=="R1"] )
shapiro.test(control$Proteobacteria[control$Sampling_Round=="R2"] )
shapiro.test(control$Proteobacteria[control$Sampling_Round=="R3"] )

shapiro.test(dex$Proteobacteria[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Proteobacteria[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Proteobacteria[dex$Sampling_Round=="R3"] )

# Actinobacteria
shapiro.test(control$Actinobacteria[control$Sampling_Round=="R1"] )
shapiro.test(control$Actinobacteria[control$Sampling_Round=="R2"] )
shapiro.test(control$Actinobacteria[control$Sampling_Round=="R3"] )

shapiro.test(dex$Actinobacteria[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Actinobacteria[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Actinobacteria[dex$Sampling_Round=="R3"] )

# Verrucomicrobia
shapiro.test(control$Verrucomicrobia[control$Sampling_Round=="R1"] )
shapiro.test(control$Verrucomicrobia[control$Sampling_Round=="R2"] )
shapiro.test(control$Verrucomicrobia[control$Sampling_Round=="R3"] )

shapiro.test(dex$Verrucomicrobia[dex$Sampling_Round=="R1"] )
shapiro.test(dex$Verrucomicrobia[dex$Sampling_Round=="R2"] )
shapiro.test(dex$Verrucomicrobia[dex$Sampling_Round=="R3"] )


# Variance Testing:
firstround = subset(data, data$Sampling_Round == "R1")
secondround = subset(data, data$Sampling_Round == "R2")
thirdround = subset(data, data$Sampling_Round == "R3")

# Firmicutes:
var.test(firstround$Firmicutes~firstround$DEX_Group)
var.test(secondround$Firmicutes~secondround$DEX_Group)
var.test(thirdround$Firmicutes~thirdround$DEX_Group)

# Bacteriodetes:
var.test(firstround$Bacteroidetes~firstround$DEX_Group)
var.test(secondround$Bacteroidetes~secondround$DEX_Group)
var.test(thirdround$Bacteroidetes~thirdround$DEX_Group)

# Euryarchaeota:
var.test(firstround$Euryarchaeota~firstround$DEX_Group)
var.test(secondround$Euryarchaeota~secondround$DEX_Group)
var.test(thirdround$Euryarchaeota~thirdround$DEX_Group)

# Proteobacteria:
var.test(firstround$Proteobacteria~firstround$DEX_Group)
var.test(secondround$Proteobacteria~secondround$DEX_Group)
var.test(thirdround$Proteobacteria~thirdround$DEX_Group)

# Actinobacteria:
var.test(firstround$Actinobacteria~firstround$DEX_Group)
var.test(secondround$Actinobacteria~secondround$DEX_Group)
var.test(thirdround$Actinobacteria~thirdround$DEX_Group)

# Verrucomicrobia:
var.test(firstround$Verrucomicrobia~firstround$DEX_Group)
var.test(secondround$Verrucomicrobia~secondround$DEX_Group)
var.test(thirdround$Verrucomicrobia~thirdround$DEX_Group)

# T Test Statistic:
t.test(thirdround$Firmicutes[thirdround$DEX_Group == "DEX"], thirdround$Firmicutes[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = TRUE)
t.test(thirdround$Bacteroidetes[thirdround$DEX_Group == "DEX"], thirdround$Bacteroidetes[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = FALSE)
t.test(thirdround$Euryarchaeota[thirdround$DEX_Group == "DEX"], thirdround$Euryarchaeota[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = TRUE)
t.test(thirdround$Proteobacteria[thirdround$DEX_Group == "DEX"], thirdround$Proteobacteria[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = TRUE)
t.test(thirdround$Actinobacteria[thirdround$DEX_Group == "DEX"], thirdround$Actinobacteria[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = TRUE)
t.test(thirdround$Verrucomicrobia[thirdround$DEX_Group == "DEX"], thirdround$Verrucomicrobia[thirdround$DEX_Group == "CONTROL"], alternative = "two.sided", var.equal = TRUE)

# First Round & Last Round Comparisons:
# Wilcoxon Test:
wilcox.test(firstround$Firmicutes[firstround$DEX_Group == "DEX"],thirdround$Firmicutes[thirdround$DEX_Group == "DEX"])
wilcox.test(firstround$Actinobacteria[firstround$DEX_Group == "DEX"],thirdround$Actinobacteria[thirdround$DEX_Group == "DEX"])
wilcox.test(firstround$Verrucomicrobia[firstround$DEX_Group == "DEX"],thirdround$Verrucomicrobia[thirdround$DEX_Group == "DEX"])

# Paired Sample T-Tests:

dexfirst <- subset(firstround, firstround$DEX_Group == "DEX")
dexthird <- subset(thirdround, thirdround$DEX_Group == "DEX")
dexthird$Bacteriodetesdifference <- dexthird$Bacteroidetes - dexfirst$Bacteroidetes
dexthird$Euryarchaeotadifference <- dexthird$Euryarchaeota - dexfirst$Euryarchaeota
dexthird$Proteobacteriadifference <- dexthird$Proteobacteria - dexfirst$Proteobacteria

# Shapiro Wilks Tests:
shapiro.test(dexthird$Euryarchaeotadifference)
shapiro.test(dexthird$Proteobacteriadifference)
shapiro.test(dexthird$Bacteriodetesdifference)
hist(dexthird$Euryarchaeotadifference, main = "Histogram of Change in Euryarchaeota Abundance", col = "red", xlab = "Euryarchaeota Change Variance")
hist(dexthird$Proteobacteriadifference, main = "Histogram of Change in Proteobacteria Abundance", col = "darkgreen", xlab = "Proteobacteria Change Variance")
hist(dexthird$Bacteriodetesdifference, main = "Histogram of Change in  Bacteriodetes Abundance", col = "darkblue", xlab = "Bacteriodetes Change Variance")

#Paired Sample T-Tests:
t.test(dexfirst$Bacteroidetes, dexthird$Bacteroidetes, paired = TRUE, alternative = "two.sided")
t.test(dexfirst$Proteobacteria, dexthird$Proteobacteria, paired = TRUE, alternative = "two.sided")
t.test(dexfirst$Euryarchaeota, dexthird$Euryarchaeota, paired = TRUE, alternative = "two.sided")
t.test(dexfirst$Euryarchaeota, dexthird$Euryarchaeota, paired = TRUE, alternative = "two.sided", conf.level = 0.9)


# Model Building:
# ANCOVA:
model1 <- aov(Euryarchaeota~Sampling_Round+DEX_Group, data = data)
summary(model1)
model2 <- aov(Euryarchaeota~Sampling_Round+DEX_Group+Diet, data = data)
summary(model2)
model3 <- aov(Euryarchaeota~Sampling_Round+DEX_Group+RFI_category, data = data)
summary(model3)
model4 <- aov(Euryarchaeota~Sampling_Round+DEX_Group+Diet+RFI_category, data=data)
summary(model4)

# Relationship Between Variables:
lmmodel1 <- lm(Euryarchaeota~DEX_Group+Sampling_Round+Diet+DEX_Group:Sampling_Round, data = data)
summary(lmmodel1)
lmmodel2 <- lm(Euryarchaeota~DEX_Group+Sampling_Round+Diet+DEX_Group:Sampling_Round+DEX_Group:Diet+RFI_category, data = data)
summary(lmmodel2)

# Model Comparison
anova(model1,model2,model3,model4)
anova(model4)
anova(lmmodel2)
# Examining DEX_Group Effect:
ggplot(data, aes(y=Euryarchaeota, x = DEX_Group, fill = Sampling_Round))+
  geom_boxplot()+
  facet_wrap(~DEX_Group, scale="free")

# Ridgelines:
ggplot(data, aes(x = Euryarchaeota, y = DEX_Group, fill = Sampling_Round)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")

# Euryarchaeota Regression Analysis:
anova(lmmodel1,lmmodel2)


# Sampling Round Charts:
firstround <- subset(data, data$Sampling_Round == "R1")
secondround <- subset(data, data$Sampling_Round == "R2")
thirdround <- subset(data, data$Sampling_Round == "R3")
par(mfrow=c(3,3))
ggplot(firstround, aes(x = Diet, y = Euryarchaeota, fill = DEX_Group))+
  geom_boxplot()+
  ylim(0.0,0.5) +
  theme_bw()+
  ggtitle("Boxplot of Euryarchaeota Relative Abundance (Sampling Round 1)")

ggplot(secondround, aes(x = Diet, y = Euryarchaeota, fill = DEX_Group))+
  geom_boxplot()+
  ylim(0.0,0.5) +
  theme_bw()+
  ggtitle("Boxplot of Euryarchaeota Relative Abundance (Sampling Round 2)")

ggplot(thirdround, aes(x = Diet, y = Euryarchaeota, fill = DEX_Group))+
  geom_boxplot()+
  ylim(0.0,0.5) +
  theme_bw()+
  ggtitle("Boxplot of Euryarchaeota Relative Abundance (Sampling Round 3)")

# Boxplot Comparison of Euryarchaeota:
p <- ggplot(data = data, aes(x=Diet, y=Euryarchaeota)) + 
  geom_boxplot(aes(fill=Sampling_Round))+
  ylim(0.0,0.4)+
  ggtitle("Comparison of Euryarchaeota Relative Abundance Across \n Sampling Rounds & Diet")+
  theme(plot.title = element_text(hjust = 0.5))
p + facet_wrap( ~ DEX_Group)

# Pie & Doughnut Charts:
View(dexthird)
dexthirdnumbers <- subset(dexthird, select= -c(1:5))
dex

df <- data.frame(
  group = colnames(dexthirdnumbers),
  value = colMeans(dexthirdnumbers)
)


dfnew <- head(df,4)
other = 1-sum((dfnew$value))
otherdataframe<-data.frame("Other",other)
names(otherdataframe)<- c("group","value")

combinedf<-rbind(dfnew,otherdataframe)
rownames(combinedf)<-c("Proteobacteria", "Firmicutes", "Euryarchaeota","Bacteriodes", "Other")

combinedf$value <- round(combinedf$value,2)

labs <- paste(combinedf$value, "%")
a<-ggdonutchart(combinedf, "value", labels = "group",
             fill = "group", color = "white")+
  ggtitle("Doughnut Plot of Mean Relative Abundancies")
a+scale_fill_discrete(name="Microbes",
                    labels=c("Proteobacteria", "Firmicutes", "Euryarchaeota","Bacteriodes", "Other"))

# Pie Charts:
pie <- ggplot(combinedf, aes(x="",y=value,fill=group))+
      geom_bar(width = 1, stat = "identity")

pie <- pie + coord_polar("y", start=0)+
                  geom_text(aes(label = paste0(round(value*100), "%")), position = position_stack(vjust = 0.5))
pie = pie + labs(x = NULL, y = NULL, fill = NULL, title = "Average Microbe Relative Abundance \n Post Treatment (Treatment Group)")
pie = pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust = 0.5, size = 22))
pie
