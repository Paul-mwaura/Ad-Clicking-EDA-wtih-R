# Import the dataset.
install.packages("data.table")
library("data.table")

advert <- fread("http://bit.ly/IPAdvertisingData")
head(advert)
View(advert)


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

# Check for outliers.
#
numeric2 <- c(advert[, 1:4])
boxplot(numeric2)

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

# Factor for the categorical Variables.
# ----
#
topic <- factor(c(advert$`Ad Topic Line`))
city <- factor(c(advert$City))
country <- factor(c(advert$Country))

summary(topic)
summary(city)
summary(Country)

# Bivariate Analysis.
#

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



# Bivariate data visualization
# ----
# 
# Scatterplot - time_spent_on_site
#

plot(clicked_on_ad, time_spent_on_site, xlab = "Clicked Ad", ylab = "Time spent on the site")


# Scatterplot - Age
#

plot(clicked_on_ad, age, xlab = "Clicked Ad", ylab = "Age")

# Scatterplot - area_income
#

plot(clicked_on_ad, area_income, xlab = "Clicked Ad", ylab = "Area Income")


# Scatterplot - net-usage
#

plot(clicked_on_ad, net_usage, xlab = "Clicked Ad", ylab = "Net Usage")


# Visualizing Relationships between Numerical Variables.
# ----
#
library(GGally)
ggpairs(swiss, 
        lower=list(continuous="smooth", wrap=c(colour="blue")),
        diag=list(continuous="bar", wrap=c(colour="blue")))

num_df <- advert[, c("Age", "Area Income", "Daily Internet Usage")]
ggpairs(num_df)

# Visualizing Relationships between Categorical Variables.
# ----
#
cat_df <- advert[, c("Ad Topic Line", "City", "Country")]
ggpairs(cat_df,  cardinality_threshold = 1000)

