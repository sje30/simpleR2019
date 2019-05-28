## Simple R script to test basic codecheck facilities
## 2019-05-28
## Requirees ggplot2
## install.packages("ggplot2")


## Dependencies
require(ggplot2)


## Here we simply generate a couple of figures and an example csv file.

x = rnorm(9999)*3+20
df = data.frame(x=x, y=sqrt(x))

## Generate some histograms




pdf(file="hist_base.pdf")
hist(x, main="base graphics histogram")
dev.off()


p = ggplot(df, aes(x=x)) + geom_histogram() + ggtitle("ggplot2 histogram")
pdf(file="hist_ggplot2.pdf")
plot(p)
dev.off()

write.csv(df, file="example_data.csv")
