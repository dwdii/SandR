# http://stackoverflow.com/questions/37063336/combine-two-ggplots-without-interfering-the-aesthetics/37063644

#path = d[as.vector(colnames(adj)), 1:2]
#path$order = seq(1:nrow(path))
#path$color = as.factor(ifelse(path$order == 1, "START", ifelse(path$order == nrow(path), "END", "PATH")))
library(ggplot2)
path <- data.frame(PC1=c(0.02303190,0.01054032,0.01548174,0.02263683,0.02262139,0.01986103),
                   PC2=c(0.01264362,0.02401583,0.02315813,0.01523706,0.01252870,0.01584703),
                   order=c(1,2,3,4,5,6))
path$color = as.factor(ifelse(path$order == 1, "START", ifelse(path$order == nrow(path), "END", "PATH")))

d <- data.frame(PC1=c(0.01394239,0.01368773,0.01423563,0.01315417,0.01318875,0.01102215),
                PC2=c(0.003256282,0.009878876,0.010897071,0.012731415,0.013687629,0.013257857),
                cellType=c("D6", "ESC", "MEF", "D6", "ESC", "MEF"))

#g1 = ggplot() + 

summary(path)
g2 = ggplot(path[order(path$order),], aes(PC1, PC2)) + 
  geom_point(data=d, aes(x=PC1, y=PC2, color=cellType)) +
  geom_point(aes(PC1, PC2, shape=color), color="black") + 
  geom_text(aes(label=order, vjust=2)) + geom_path()
g2

g3 = ggplot(path[order(path$order),], aes(PC1, PC2)) + 
  #geom_point(data=d, aes(x=PC1, y=PC2, color=cellType)) +
  geom_point(aes(PC1, PC2, colour=order, shape=color)) + 
  scale_colour_gradient(low = "green", high = "red") +
  geom_text(aes(label=order, vjust=2)) + geom_path()

g3