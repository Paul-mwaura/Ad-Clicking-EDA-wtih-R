# Advertisement
## Business Understanding.
A Kenyan entrepreneur has created an online cryptography course and would want to advertise it on her blog. She currently targets audiences originating from various countries. In the past, she ran ads to advertise a related course on the same blog and collected data in the process. She would now like to employ your services as a Data Science Consultant to help her identify which individuals are most likely to click on her ads. 
## Data Understanding
The dataset has 1000 entries and 10 columns.
The columns include:

Daily Time Spent on Site
Age
Area Income
Daily Internet Usage
Ad Topic Line
City 
Male
Country
Timestamp
Clicked on Ad
## Data Relevance.
The data was relevant for carrying out Exploratory Data Analysis.

## Loading the dataset.

```R
# Import the dataset.
install.packages("data.table")
library("data.table")

advert <- fread("http://bit.ly/IPAdvertisingData")
head(advert)
View(advert)

```
## Data Cleaning.

```R
# Lets Identify missing data in your dataset 
# by using the function is.na() 
# ---
# 
colSums(is.na(advert))

# Removing these duplicated rows in the dataset or 
# showing these unique items and assigning to a variable unique_items below
# ---
#
unique_items <- advert[!duplicated(advert), ]

# Preview the unique values.
#
head(unique_items)

# Check for duplicated values.
#
dup_items <- advert[duplicated(advert)]

# Preview duplicated items.
#
dup_items

```

## Checking for Outliers.
```R

# Check for outliers.
#
numeric2 <- c(advert[, 1:4])
boxplot(numeric2)
```

## Data Analysis

### Univariate Analysis.
```R
# Univariate Analysis.
#
time_spent_on_site <- c(advert$`Daily Time Spent on Site`)
age <- c(advert$`Age`)
area_income <- c(advert$`Area Income`)
net_usage <- c(advert$`Daily Internet Usage`)
clicked_on_ad <- c(advert$`Clicked on Ad`)

# Barplots of Numerical columns.
#
hist(time_spent_on_site)
hist(age)
hist(area_income)
hist(net_usage)
hist(clicked_on_ad)
```

### Bivariate Analysis

```R
# Bivariate Analysis.
#
```
#### Numeric Data Covariance

```R
# Determine the covariance
# --- 
# time_spent_on_site and clicked_on_ad
#
cov(time_spent_on_site, clicked_on_ad)

# --- 
# age and clicked_on_ad
#
cov(age, clicked_on_ad)

# --- 
# area_income and clicked_on_ad
#
cov(area_income, clicked_on_ad)

# --- 
# net_usage and clicked_on_ad
#
cov(net_usage, clicked_on_ad)
```

#### Numeric Data Correlation
```R
# Determine the correlation
# --- 
# time_spent_on_site and clicked_on_ad
#
cor(time_spent_on_site, clicked_on_ad)

# --- 
# age and clicked_on_ad
#
cor(age, clicked_on_ad)

# --- 
# area_income and clicked_on_ad
#
cor(area_income, clicked_on_ad)

# --- 
# net_usage and clicked_on_ad
#
cor(net_usage, clicked_on_ad)
```

#### Scatterplots Data Visualization.

```R
# Bivariate data visualization
# ----
# 
# Scatterplot - time_spent_on_site
#

plot(clicked_on_ad, time_spent_on_site, xlab = "Clicked Ad", ylab = "Time spent on the site")
```

#### Time Spent on Site ScatterPlot

```R
# Scatterplot - Age
#

plot(clicked_on_ad, age, xlab = "Clicked Ad", ylab = "Age")
```
#### Age ScatterPlot
```R
# Scatterplot - area_income
#

plot(clicked_on_ad, area_income, xlab = "Clicked Ad", ylab = "Area Income")
```

#### Net Usage ScatterPlot
```R
# Scatterplot - net-usage
#

plot(clicked_on_ad, net_usage, xlab = "Clicked Ad", ylab = "Net Usage")

```