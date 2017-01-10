#! /usr/bin/env Rscript
#====================================Libraries
library(ggplot2)

#====================================Analysis
f <- file("stdin")
open(f)
d<-data.frame(Letters=c())
while(length(line <- readLines(f,n=1)) > 0) {
  temp<-data.frame(Letters=strsplit(line,split=""))
  names(temp)<-"Letters"
    d<-rbind(d,temp)
  #write(line, stderr())
}

p<-qplot(d$Letters,fill=I('royalblue'),xlab="Letters",main="Letter Frequency")+
  theme_bw()+
  geom_text(stat='count',aes(label=..count..),vjust=-0.25)
#+ theme(axis.text.x = element_text(angle = 0, hjust = 1))

ggsave(filename="barchart.png",plot=p,dpi=600)
