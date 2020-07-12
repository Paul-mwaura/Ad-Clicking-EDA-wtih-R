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
Observations.
The dataset does not have null values.
It also does not have duplicated values.

## Checking for Outliers.
```R
par(mar=c(1,1,1,1))
# Check for outliers.
#
numeric <- c(advert[, 1:4])
boxplot(numeric)
```

## Dropping Outliers.

```R
# Dropping null values.
#
numeric_clean <- na.omit(numeric)

numeric_clean
```
We detected outliers in the numerical columns in the dataset, hence we dropped all the outliers since we do not require them in our analysis.
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
The covariance between Age and clicked_on_ad is 2.165
The covariance between Daily Time spent on Site and clicked_on_ad is -5.9331
The covariance between Area Income and clicked_on_ad is -3195.989
The covariance between Daily Internet Usage and clicked_on_ad is -17.27409

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
The correlation between Age and Daily time spent on site is -0.332
The correlation between Area Income and Age is -0.183
The correlation between Area Income and Daily time spent on site is 0.311
The correlation between Daily Internet Usage and Daily time spent on site is 0.519
The correlation between Age and Daily Internet Usage is -0.367
The correlation between Area Income and Daily Internet Usage is 0.337


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
We observe that the longer a user spends on the the Website the more likely the are to click on an Ad.
Most of the users who click on the Ads are between the ages of 20 and 60, with ages 28 to 34 having the highest number.
The area of income greatly influences the chances of users clicking on the Ads. Users in high income areas are more likely to click on the Ads.
The total net usage of a user does not really affect the chances of the user clicking on the Ads.
Lastly we also observe that there is no major difference in the number of customers who click on Ads and those who do not.

#### Relationships between Numerical Variables.
```R
# Visualizing Relationships between Numerical Variables.
# ----
#
library(GGally)

num_df <- advert[, c("Daily Time Spent on Site","Age", "Area Income", "Daily Internet Usage")]

ggpairs(num_df, 
        lower=list(continuous="smooth", wrap=c(colour="blue")),
        diag=list(continuous="bar", wrap=c(colour="blue"),
        cardinality_threshold = 1000))
        


```
Visualizing the relationships between the numeric Variables we observe that:

1. The amount of daily time spent on the site is not different for users of all ages.
2. There's a slight increase in the daily time spent on the site for high income areas.
3. There is an increase in the amount of internet usage with increase in the time spent on the site.
4. We observe that there is no major difference in the user's age and the area of income.
5. We also notice that the higher the user's age the lower their daily internet usage.
6. Lastly, there is an increase in the amount of daily internet usage in high income areas.

#### Relationships between Categorical Variables.
```R
# Visualizing Relationships between Categorical Variables.
# ----
#
cat_df <- advert[, c("Ad Topic Line", "City", "Country")]
ggpairs(cat_df,  cardinality_threshold = 1000)