# 🚗 Used-Car Price Analytics

**R · Statistical Analysis · Probability Modelling · Hypothesis Testing**

> 🎓 **Academic Data Analytics Project**  
> **Assessment Grade: 100%**

A statistical analysis of used-car market data using **R**, covering exploratory data analysis, descriptive statistics, outlier detection, probability distributions, predictive applications, and hypothesis testing.

---

## 📌 Project Overview

This project analyses the **CarDekho used-car dataset**, containing **4,340 vehicle records and 8 variables**.

The analysis focuses on used-car prices and related vehicle attributes, including:

- 💰 Selling price
- 🚗 Vehicle characteristics
- 🛣️ Kilometres driven
- ⛽ Fuel type
- ⚙️ Transmission type
- 🏪 Seller type
- 👤 Previous ownership

The project applies statistical methods to understand distributions, variability, uncertainty, relationships between categorical variables, and potential outliers.

---

## 🎯 Objectives

The analysis was structured around three main objectives:

1. 📊 **Explore and describe the dataset** using appropriate visualisations and descriptive statistics.
2. 📈 **Model uncertainty** using probability distributions and apply the models to predictive analysis.
3. 🧪 **Apply statistical hypothesis tests** to investigate relationships and distributions within the dataset.

---

## 📊 Exploratory & Descriptive Analysis

The analysis selected `selling_price` as the primary continuous variable for detailed statistical investigation.

### Visual Analysis

The dataset was explored using histograms, scatter plots, bar charts, pie charts, and distribution comparisons. Selling price was examined in relation to factors such as vehicle age, fuel type, and transmission type.

### Selling Price Statistics

| Measure | Result |
|---|---:|
| Mean | ₹504,127.3 |
| Median | ₹350,000 |
| Mode | ₹300,000 |
| Minimum | ₹20,000 |
| Maximum | ₹8,900,000 |
| IQR | ₹391,250.2 |
| Standard Deviation | ₹578,548.7 |
| Coefficient of Variation | 114.76% |
| Mean Absolute Deviation | ₹246,372.7 |

The selling-price distribution is strongly right-skewed, with higher-priced vehicles increasing the mean above the median. The high coefficient of variation indicates substantial relative variability in vehicle prices.

---

## 🔎 Outlier Analysis

Two approaches were used to investigate unusual observations.

### Chebyshev's Rule

A one-sigma interval was constructed using the sample mean and standard deviation to investigate observations outside the proposed interval.

### Box-Plot / IQR Method

The standard **1.5 × IQR** rule was applied to identify potential outliers.

The box-plot approach identified **271 potential outliers**, representing approximately **6.24% of the dataset**.

---

## 🎲 Probability Modelling

Four variables were selected and matched with probability models appropriate to their data characteristics.

| Variable | Probability Model | Purpose |
|---|---|---|
| `selling_price` | Log-Normal | Model continuous, right-skewed prices |
| `fuel` | Multinomial | Model multiple categorical fuel outcomes |
| `transmission` | Bernoulli | Model binary transmission outcomes |
| `km_driven` | Gamma | Model positive, right-skewed mileage |

### Log-Normal — Selling Price

Estimated parameters:

```text
Meanlog = 12.76418
Sdlog   = 0.8392654
```

### Multinomial — Fuel

Observed proportions included:

- Diesel: 49.61%
- Petrol: 48.92%
- CNG: 0.92%
- LPG: 0.53%
- Electric: 0.02%

Diesel was the most frequent fuel category.

### Bernoulli — Transmission

Transmission was treated as a binary outcome:

- Manual
- Automatic

Manual transmission was the dominant category.

### Gamma — Kilometres Driven

`km_driven` was modelled using a Gamma distribution.

Estimated shape parameter:

```text
α = 2.015253
```

The analysis also examined how different Gamma shape parameters affect the distribution.

---

## 🔮 Predictive Applications

The probability models were considered for:

- 💰 Resale-price estimation and pricing analysis
- ⛽ Fuel-category probability modelling
- ⚙️ Transmission-outcome prediction
- 🛣️ Mileage modelling and usage analysis

The report also produced example predictions from the probability models.

---

## 🧪 Hypothesis Testing

### Chi-Square Test of Independence

A Chi-Square test investigated whether **fuel type and transmission type** are independent.

**Significance level:** `α = 0.01`

**Hypotheses:**

```text
H₀: Fuel type and transmission type are independent.
H₁: Fuel type and transmission type are dependent.
```

**Results:**

```text
Test statistic = 24.47787
Critical value = 13.2767
```

Since the test statistic exceeded the critical value, the null hypothesis was rejected.

**Conclusion:** The analysis found statistical evidence of a relationship between fuel type and transmission type.

### Chi-Square Goodness-of-Fit Test

A Chi-Square Goodness-of-Fit test was applied to `seller_type` at `α = 0.05`. Observed seller-type frequencies were compared with an assumed probability distribution to evaluate whether the proposed probabilities were appropriate for modelling the categorical variable.

### Test of Mean

A one-sided test of mean was applied to `km_driven`:

```text
H₀: μ ≤ μ₀
H₁: μ > μ₀

α = 0.05
μ₀ = 4.5
```

The test statistic was compared with the upper-tail critical value from the standard normal distribution.

---

## 💡 Key Findings

- 💰 Used-car selling prices showed **substantial variability and strong right skew**.
- 📊 The mean selling price was higher than the median, reflecting the influence of higher-priced vehicles.
- 🔎 The 1.5 × IQR method identified **271 potential price outliers**.
- 🎲 Different probability distributions were applied according to the characteristics of each variable.
- ⛽ Diesel was the most frequent fuel category.
- ⚙️ Manual transmission was the dominant transmission category.
- 🧪 The Chi-Square independence test provided evidence of a relationship between fuel type and transmission type.
- 📈 Probability models demonstrated how statistical distributions can support predictive analysis.

---

## 🛠️ Tools & Methods

| Category | Tools / Methods |
|---|---|
| Programming | R |
| Statistical Analysis | Base R statistical functions |
| Data Exploration | Exploratory Data Analysis |
| Visualisation | Histograms, scatter plots, bar charts, pie charts |
| Descriptive Statistics | Mean, median, mode, variance, SD, IQR, CV, MAD |
| Outlier Detection | Chebyshev's Rule, Box Plot / IQR |
| Probability | Log-Normal, Multinomial, Bernoulli, Gamma |
| Hypothesis Testing | Chi-Square Independence, Goodness-of-Fit, Test of Mean |
| Predictive Analysis | Probability-based prediction |

---

## 📁 Repository Structure

```text
Used-Car-Price-Analytics/
│
├── README.md
│
├── report/
│   └── statistical-analysis-report.pdf
│
├── code/
│   └── statistical-analysis.R
│
└── data/
    └── car-details.csv
```

---

## 📄 Report

The complete statistical analysis, calculations, R code, visualisations, and interpretation are available in the `report/` directory.

The repository also includes the R implementation and dataset used for the analysis.

---

## 🎓 Academic Achievement

**Assessment Grade: 100%**

This project demonstrates the application of statistical theory and R programming to a real-world used-car dataset.

---

## 👩‍💻 Skills Demonstrated

`R` · `Statistical Analysis` · `EDA` · `Probability Distributions` · `Hypothesis Testing` · `Outlier Detection` · `Data Visualisation` · `Predictive Analysis`
