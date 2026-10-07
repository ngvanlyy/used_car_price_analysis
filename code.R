#Question 1
cars = read.csv(file.choose()) # choose the dataset file
head(cars)

#(a)	Describe the dataset using appropriate plots/curves/charts
hist(cars$selling_price, col='purple')
install.packages("ggplot2")
library(ggplot2)
ggplot(data = cars, aes(x = year, y = selling_price)) + geom_point()
ggplot(data = cars, aes(x=year, y=selling_price)) +
  geom_bar(stat="identity")
ggplot(data = cars, aes(x = fuel, y = selling_price)) + geom_point()
ggplot(data = cars, aes(x = name, y = selling_price)) + geom_point()
ggplot(cars, aes(x="", y=transmission, fill=transmission)) + geom_bar(stat="identity", width=1) + coord_polar("y", start=0)

#b ) Consider one of continuous attributes, and compute central and variational measures.

mean_Price=mean(cars$selling_price)
mean_Price
median_Price=median(cars$selling_price)
median_Price
Price_table =table(cars$selling_price)
mode_Price = names(Price_table)[which(Price_table==max(Price_table))]
mode_Price

# 
range_Price = max(cars$selling_price)-min(cars$selling_price)
range_Price
Q=quantile(cars$selling_price)
Q
Q1 <- quantile(cars$selling_price, 0.25)
print(Q1)
Q3 <- quantile(cars$selling_price, 0.75)
print(Q3)
IQR = Q3-Q1
IQR
SD_Price = sd(cars$selling_price)
SD_Price
varience_Price = var(cars$selling_price)
varience_Price
cv <- (SD_Price / mean_Price) * 100
cv
mad_value <- mad(cars$selling_price, center = mean(cars$selling_price), constant = 1)
mad_value

#c ) For a particular variable of the dataset, use Chebyshev’s rule, and propose one-sigma interval. Based on your proposed interval, specify the outliers if any.
#Chebyshev's Rule for outliers

k = 1
lowerRange = mean_Price - k * SD_Price
upperRange = mean_Price + k * SD_Price
round(lowerRange, 2)
round(upperRange, 2)
outliers = cars$Selling_Price < lowerRange | cars$Selling_Price > upperRange
sum(outliers)


#d ) Explain how the box-plot technique can be used to detect outliers. Apply this technique for one attribute of the dataset

boxplot(cars$selling_price, main = "Box Plot of selling_price",col="red")
q = quantile(cars$selling_price, c(0.25, 0.75))
iqr = q[2] - q[1]
print(iqr)
upperOutliers = q[2] + 1.5 * iqr
print(upperOutliers)
lowerOutliers = q[1] - 1.5 * iqr
print(lowerOutliers)
boxplotOutliers = cars$selling_price > upperOutliers | cars$selling_price < lowerOutliers
print(boxplotOutliers)
sum(boxplotOutliers)

# Print Outlier Car Names
outlier_cars <- cars[boxplotOutliers, c("name", "selling_price")]
print(outlier_cars)

# Highlight outliers on the boxplot

boxplot(cars$selling_price, main="Boxplot with Outliers", ylab="selling_price", col="green")
points(which(cars$selling_price %in% outliers), outliers, col="yellow", pch=16)

#Question 2
# Log-Normal distribution - Selling_Price
cars =read.csv(file.choose())
head(cars)
# Data Preprocessing
# Handle missing values
cars <- na.omit(cars)
log_selling_price <- log(cars$selling_price)

meanlog <- mean(log_selling_price, na.rm = TRUE)
meanlog
sdlog <- sd(log_selling_price, na.rm = TRUE)
sdlog

# Create a histogram of selling_price
hist(cars$selling_price, breaks = 30, probability = TRUE, main = "Log-Normal Fit - Selling Price", xlab = "Selling Price")

# Define x as a sequence of values across the range of selling_price
x <- seq(min(cars$selling_price, na.rm = TRUE), max(cars$selling_price, na.rm = TRUE), length = 100)

# Calculate the Log-Normal PDF
log_normal_pdf <- dlnorm(x, meanlog = meanlog, sdlog = sdlog)

# Overlay the Log-Normal curve on the histogram
lines(x, log_normal_pdf, col = "red", lwd = 2)



#Multinominal Distribution
X=cars$fuel
t=table(X); t
mode=names(t)[which(t==max(t))]; print(mode)
p=t/sum(t);p
barplot(p, main = "Multinomial Distribution - fuel", xlab = "fuel", ylab = "Outcomes", ylim = c(0, 1))
points(x = 0:5, y = rep(1/6, 6), col = "red")

#Bernoulli Distribution - transmission

transmission = cars$transmission
transmission
transmission_prop = table(transmission) / nrow(data)
transmission_param = transmission_prop[2]  # Proportion 
barplot(transmission_prop, main = "Bernoulli Distribution - Transmission", xlab = "transmission", ylab = "Outcomes", ylim = c(0, 1))
abline(h = transmission_param, col = "yellow")

#Gamma Distribution
X = cars$km_driven
E=mean(X); V=var(X)
#parameter estimation
lambda=E/V                                               
alpha=lambda*E
lambda
alpha

#P(X>6500)=1-P(X<6500)
1-pgamma(6500,alpha,lambda)
alpha1=5
alpha2=1
lambda=.5
x=seq(0,15,0.01)
pdf1=dgamma(x,alpha1,lambda)
pdf2=dgamma(x,alpha2,lambda)
plot(x,pdf1,ylim=c(0,.5),col='red',main="Gamma Distribution - Kms_Driven ")
lines(x,pdf2,col='blue')
#c ) Express the way in which each model can be used for the predictive analytics, then find the prediction for each attribute.
#Log Normal Distribution
X=data$selling_price
meanlog <- log(mean(cars$selling_price))
sdlog <- log(sd(cars$selling_price))

price_probability <- plnorm(X, meanlog = meanlog, sdlog = sdlog)

price_prediction <- X[which.max(price_probability)]

# Display the prediction
c("The predicted price is", price_prediction)

#Multinomial Distribution
x = c(1, 1, 0, 0, 0)  # Adjusted to match the number of categories in p
n = sum(x)  # Total number of trials
dmultinom(x, n, p)
c('The predicted Fuel_type is:',mode)
#Bernoulli Distribution
trans = transmission_prop
transmission_pred = names(transmission_prop)[which.max(transmission_prop)]
c("The predicted transmission type  is", transmission_pred)
#Gamma Distribution
data=rgamma(10000,alpha,lambda)
pred=mean(data)
c("The predicted Kms_Driven is",pred)

#Question 3
#A
# Load dataset
data <- read.csv(file.choose())

# Extract categorical variables
X1 <- data$fuel  # Fuel Type
X2 <- data$transmission  # Transmission Type

# Create contingency table
C_table <- table(X1, X2)
print("Contingency Table:")
print(C_table)

# Compute expected frequencies
rows <- nrow(C_table)
cols <- ncol(C_table)
N <- nrow(data)  # Total number of observations

E <- matrix(NA, rows, cols)  # Initialize expected frequency matrix
for (i in 1:rows) {
  for (j in 1:cols) {
    Ci <- sum(C_table[i, ])  # Row sum
    Cj <- sum(C_table[, j])  # Column sum
    E[i, j] <- (Ci * Cj) / N  # Expected frequency
  }
}

# Compute test statistic (Chi-Square value)
test.value <- sum((C_table - E)^2 / E)
print(paste("Test Statistic (Chi-Square):", test.value))

# Determine critical value
df <- (rows - 1) * (cols - 1)  # Degrees of freedom
c.value <- qchisq(1 - 0.01, df = df)  # Critical value at alpha=0.01
print(paste("Critical Value:", c.value))

# Decision rule
if (test.value < c.value) {
  print("H0 is accepted: Fuel type and Transmission are independent")
} else {
  print("H0 is rejected: Fuel type and Transmission are dependent")
}

#B

# Load dataset
data <- read.csv(file.choose())

# Extract categorical variable
X <- data$seller_type  # Seller Type

# Observed frequencies
C_table2 <- table(X)
print("Observed Frequencies:")
print(C_table2)

# Expected probabilities (assuming uniform distribution)
num_categories <- length(C_table2)  # Number of unique categories
P0 <- rep(1 / num_categories, num_categories)  # Equal probability assumption
N <- sum(C_table2)  # Total number of observations
E <- N * P0  # Expected frequencies

# Check for dimension mismatch
if (length(C_table2) != length(E)) {
  stop("Error: Number of categories in observed and expected frequencies do not match!")
}

# Compute test statistic
test.value <- sum((C_table2 - E)^2 / E)
print(paste("Test Statistic (Chi-Square):", test.value))

# Determine critical value
alpha <- 0.05
df <- num_categories - 1  # Degrees of freedom
c.value <- qchisq(1 - alpha, df = df)  # Critical value at alpha=0.05
print(paste("Critical Value:", c.value))

# Decision rule
if (test.value < c.value) {
  print("H0 is accepted: The observed distribution matches the expected distribution.")
} else {
  print("H0 is rejected: The observed distribution does not match the expected distribution.")
}

#C

# Load dataset
data <- read.csv(file.choose())

# Extract continuous variable
Y <- data$km_driven  # Kilometers Driven

# Parameters
alpha <- 0.05
Mu0 <- 4.5  # Hypothesized Mean

# Compute sample statistics
Y_bar <- mean(Y)  # Sample Mean
SD <- sd(Y)       # Standard Deviation
N <- length(Y)    # Sample Size

# Compute test statistic (Z-score)
Z <- (Y_bar - Mu0) / (SD / sqrt(N))
print(paste("Test Statistic (Z):", Z))

# Determine critical value
c_value <- qnorm(1 - alpha)
print(paste("Critical Value:", c_value))

# Decision rule
if (Z < c_value) {
  print("H0 is accepted: The sample mean does not significantly exceed the hypothesized mean.")
} else {
  print("H0 is rejected: The sample mean is significantly greater than the hypothesized mean.")
}

