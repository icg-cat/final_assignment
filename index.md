---
title: "Presentation pitch"
author: "icg"
date: "8/25/2020"
mode: standalone
---




## Introduction

The [shiny app](https://icgbcn.shinyapps.io/Final_assignment/) is a basic data exploration tool. 

It allows a visual inspection of the variables of a dataset, using univariate and bivariate plots. 


```r
data ("iris")

ggplot(data = iris, 
       aes(x = Sepal.Length, 
             y = Sepal.Width, 
             color = Species)) + 
   geom_point() +
   theme_minimal()
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png)


---
 
## App contents
 
The app contains a sidebar and 4 tabs:

> - Sidebar: contains two widgets to select the variables
> - Tab 1: Instructions to use the app
> - Tab 2: univariate plots for selected variables
> - Tab 3: bivariate plot for selected variables
> - Tab 4: mean ratio between selected variables

--- 

## Iris data

The app runs on the iris data, but it can be easily adapted to present any other data set. The ploting functions is ggplot2::qplot, which chooses the most adequate geom depending on the class of the selected variables: 


```r
as_tibble(iris) %>% 
   kable(.)
```



| Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species    |
|------------:|-----------:|------------:|-----------:|:----------|
|          5.1|         3.5|          1.4|         0.2|setosa     |
|          4.9|         3.0|          1.4|         0.2|setosa     |
|          4.7|         3.2|          1.3|         0.2|setosa     |
|          4.6|         3.1|          1.5|         0.2|setosa     |
|          5.0|         3.6|          1.4|         0.2|setosa     |
|          5.4|         3.9|          1.7|         0.4|setosa     |
|          4.6|         3.4|          1.4|         0.3|setosa     |
|          5.0|         3.4|          1.5|         0.2|setosa     |
|          4.4|         2.9|          1.4|         0.2|setosa     |
|          4.9|         3.1|          1.5|         0.1|setosa     |


##  

Thank you!
