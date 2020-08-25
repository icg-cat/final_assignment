# see: https://gist.github.com/ramnathv/7155503
library(devtools)
install_github('ramnathv/slidify')
install_github('ramnathv/slidifyLibraries')

library(slidify)

dir.create('mydeck')
setwd('mydeck')
file.edit('index.Rmd')

slidify('index.Rmd')
slidify::publish("Presentation", host = 'gist')

