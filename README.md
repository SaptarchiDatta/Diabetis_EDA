````markdown
# Healthcare Diabetes Risk EDA with R

## Project Overview

This project performs Exploratory Data Analysis (EDA) on a synthetic healthcare dataset using R.

The dataset contains patient demographic information, health measurements, lifestyle factors, and diabetes status.

The purpose of this project is to understand patterns in healthcare data and explore relationships between variables such as age, BMI, glucose, blood pressure, cholesterol, insulin, HbA1c, physical activity, and diabetes status.

> **Note:** This is a synthetic dataset created for educational and portfolio purposes. The analysis is not intended for medical diagnosis or clinical decision-making.

---

## Objectives

The main objectives of this project are:

- Create a healthcare dataset using R
- Understand the structure of the dataset
- Perform exploratory data analysis
- Check data types
- Check missing values
- Check duplicate records
- Analyze categorical variables
- Analyze numerical variables
- Calculate descriptive statistics
- Analyze diabetes distribution
- Compare health measurements between diabetic and non-diabetic patients
- Analyze BMI categories
- Analyze age groups
- Analyze physical activity
- Analyze family history
- Analyze smoking status
- Identify potential outliers
- Calculate correlations
- Create healthcare-related visualizations
- Generate useful analytical insights

---

## Dataset

The dataset contains 100 synthetic patient records and the following variables:

| Column | Description | Data Type |
|---|---|---|
| `Patient_ID` | Unique patient identifier | Integer |
| `Age` | Patient age | Integer |
| `Gender` | Patient gender | Categorical |
| `BMI` | Body Mass Index | Numeric |
| `Glucose` | Blood glucose measurement | Numeric |
| `Blood_Pressure` | Blood pressure measurement | Numeric |
| `Cholesterol` | Cholesterol measurement | Numeric |
| `Insulin` | Insulin measurement | Numeric |
| `Physical_Activity` | Physical activity level | Categorical |
| `Smoking` | Smoking status | Categorical |
| `Family_History` | Diabetes family history | Categorical |
| `HbA1c` | HbA1c measurement | Numeric |
| `Diabetes` | Diabetes status | Categorical |
| `BMI_Category` | BMI classification created during analysis | Categorical |
| `Age_Group` | Age group created during analysis | Categorical |

---

## Dataset Structure

```text
Healthcare Diabetes Dataset
│
├── Patient_ID
├── Age
├── Gender
├── BMI
├── Glucose
├── Blood_Pressure
├── Cholesterol
├── Insulin
├── Physical_Activity
├── Smoking
├── Family_History
├── HbA1c
└── Diabetes
````

---

## Tools and Technologies

* R
* RStudio
* Base R
* dplyr
* Statistical Analysis
* Data Visualization

---

## R Packages

The project uses the `dplyr` package for data manipulation.

```r
library(dplyr)
```

If the package is not installed:

```r
install.packages("dplyr")
```

---

## Project Workflow

The analysis follows a structured EDA workflow:

```text
Create Dataset
      ↓
Understand Dataset
      ↓
Check Data Types
      ↓
Check Missing Values
      ↓
Check Duplicates
      ↓
Analyze Categorical Variables
      ↓
Analyze Numerical Variables
      ↓
Create Derived Variables
      ↓
Group-Based Analysis
      ↓
Outlier Detection
      ↓
Correlation Analysis
      ↓
Visualization
      ↓
Healthcare Insights
```

---

## Data Inspection

The dataset is initially inspected using:

```r
head(df)
tail(df)
dim(df)
nrow(df)
ncol(df)
names(df)
str(df)
summary(df)
```

These functions help understand:

* Number of records
* Number of variables
* Variable names
* Data types
* Basic statistics
* Dataset structure

---

## Missing Value Analysis

Missing values are checked using:

```r
colSums(is.na(df))
```

The total number of missing values is calculated using:

```r
sum(is.na(df))
```

This is an important step because missing healthcare measurements can affect statistical analysis.

---

## Duplicate Analysis

Duplicate records are checked using:

```r
sum(duplicated(df))
```

Duplicate rows can lead to incorrect patient counts and biased analysis.

---

## Categorical Analysis

The following categorical variables are analyzed:

* Gender
* Physical Activity
* Smoking
* Family History
* Diabetes

Example:

```r
table(df$Diabetes)
```

Percentage distribution:

```r
prop.table(table(df$Diabetes)) * 100
```

---

## Numerical Analysis

The following numerical variables are analyzed:

* Age
* BMI
* Glucose
* Blood Pressure
* Cholesterol
* Insulin
* HbA1c

For each variable, the project calculates statistics such as:

* Mean
* Median
* Minimum
* Maximum
* Quartiles

Example:

```r
mean(df$Glucose)
median(df$Glucose)
min(df$Glucose)
max(df$Glucose)
```

---

## Diabetes Analysis

Patients are divided into:

```text
Diabetes = Yes
Diabetes = No
```

The project compares these groups across health measurements.

For example:

```r
diabetes_summary <- df %>%
  group_by(Diabetes) %>%
  summarise(
    Average_Age = mean(Age),
    Average_BMI = mean(BMI),
    Average_Glucose = mean(Glucose),
    Average_Blood_Pressure = mean(Blood_Pressure),
    Average_Cholesterol = mean(Cholesterol),
    Average_Insulin = mean(Insulin),
    Average_HbA1c = mean(HbA1c),
    Patient_Count = n()
  )
```

This produces a summary of health measurements by diabetes status.

---

## BMI Analysis

BMI is divided into four categories:

```text
BMI < 18.5       → Underweight
18.5 - 24.9      → Normal
25 - 29.9        → Overweight
30+              → Obese
```

The categories are created using:

```r
df <- df %>%
  mutate(
    BMI_Category = case_when(
      BMI < 18.5 ~ "Underweight",
      BMI < 25 ~ "Normal",
      BMI < 30 ~ "Overweight",
      TRUE ~ "Obese"
    )
  )
```

The project then examines diabetes distribution across these BMI categories.

---

## Age Group Analysis

Patients are grouped into:

```text
20-29
30-39
40-49
50-59
60+
```

This allows the project to compare diabetes distribution across different age groups.

---

## Lifestyle Analysis

The project examines:

* Physical activity
* Smoking
* Family history

For example:

```r
activity_summary <- df %>%
  group_by(Physical_Activity) %>%
  summarise(
    Average_BMI = mean(BMI),
    Average_Glucose = mean(Glucose),
    Average_HbA1c = mean(HbA1c),
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n()
  )
```

---

## Correlation Analysis

Correlation is used to examine relationships between numerical variables.

The project investigates relationships such as:

```text
Age ↔ Glucose
BMI ↔ Glucose
BMI ↔ HbA1c
Glucose ↔ HbA1c
Cholesterol ↔ Glucose
Insulin ↔ Glucose
```

Example:

```r
cor(df$Glucose, df$HbA1c)
```

A complete correlation matrix is also generated:

```r
numeric_columns <- df[, c(
  "Age",
  "BMI",
  "Glucose",
  "Blood_Pressure",
  "Cholesterol",
  "Insulin",
  "HbA1c"
)]

correlation_matrix <- cor(numeric_columns)

correlation_matrix
```

---

## Outlier Detection

Potential outliers are explored using boxplots.

Examples:

```r
boxplot(df$BMI)$out
```

```r
boxplot(df$Glucose)$out
```

```r
boxplot(df$HbA1c)$out
```

Outlier analysis is important in healthcare datasets because extreme measurements can significantly affect statistical summaries.

---

## Data Visualization

The project uses Base R to create several visualizations.

### Age Distribution

```r
hist(df$Age)
```

### BMI Distribution

```r
hist(df$BMI)
```

### Glucose Distribution

```r
hist(df$Glucose)
```

### HbA1c Distribution

```r
hist(df$HbA1c)
```

### Diabetes Distribution

```r
barplot(table(df$Diabetes))
```

### Diabetes by BMI Category

```r
barplot(
  table(df$BMI_Category, df$Diabetes),
  beside = TRUE
)
```

### Glucose by Diabetes Status

```r
boxplot(
  Glucose ~ Diabetes,
  data = df
)
```

### BMI by Diabetes Status

```r
boxplot(
  BMI ~ Diabetes,
  data = df
)
```

### HbA1c by Diabetes Status

```r
boxplot(
  HbA1c ~ Diabetes,
  data = df
)
```

### Glucose vs HbA1c

```r
plot(
  df$Glucose,
  df$HbA1c
)
```

---

## Key Questions

The project is designed to investigate questions such as:

1. What percentage of patients have diabetes?
2. What is the average age of the patients?
3. How does BMI differ between diabetes groups?
4. How does glucose differ between diabetes groups?
5. How does HbA1c differ between diabetes groups?
6. Does glucose show a relationship with HbA1c?
7. Does BMI show a relationship with glucose?
8. How does diabetes distribution vary across age groups?
9. How does diabetes distribution vary across BMI categories?
10. How does physical activity relate to diabetes status?
11. How does family history relate to diabetes status?
12. Are there potential outliers in the health measurements?

---

## Project Structure

```text
Healthcare-Diabetes-Risk-EDA/
│
├── README.md
│
├── Healthcare_Diabetes_EDA.R
│
├── healthcare_diabetes_data.csv
│
└── visualizations/
```

---

## How to Run

### 1. Install R

Install R and RStudio on your computer.

### 2. Install Required Package

Run:

```r
install.packages("dplyr")
```

### 3. Open the R Script

Open:

```text
Healthcare_Diabetes_EDA.R
```

### 4. Run the Script

Run the script from top to bottom in RStudio.

The script will:

* Generate the healthcare dataset
* Perform data inspection
* Analyze patient characteristics
* Analyze diabetes status
* Create BMI and age groups
* Perform correlation analysis
* Detect potential outliers
* Create visualizations
* Export the dataset as CSV

---

## Skills Demonstrated

This project demonstrates practical skills in:

* R Programming
* Data Frames
* Data Manipulation
* Exploratory Data Analysis
* Healthcare Data Analysis
* Descriptive Statistics
* Categorical Analysis
* Numerical Analysis
* Grouped Analysis
* Data Filtering
* Feature Creation
* Correlation Analysis
* Outlier Detection
* Data Visualization
* `dplyr`

---

## Future Improvements

This project can be extended with:

* Real-world healthcare datasets
* Missing-value treatment
* Duplicate treatment
* Data validation
* Advanced outlier detection
* `ggplot2` visualizations
* Correlation heatmaps
* Statistical hypothesis testing
* Logistic regression
* Diabetes risk prediction
* Machine learning models
* Model evaluation
* Feature importance analysis
* Interactive healthcare dashboard
* Power BI healthcare dashboard
* Python implementation

---

## Disclaimer

This project uses synthetic data created for educational and portfolio purposes.

The results are intended to demonstrate data analysis techniques and should not be interpreted as medical advice, clinical evidence, or a diagnostic tool.

---

## Author

**Saptarchi Datta**

BCA–MCA Dual Degree
Techno India University, West Bengal

---

## Conclusion

This project demonstrates a complete healthcare-focused EDA workflow in R, starting from dataset creation and progressing through data inspection, descriptive statistics, categorical analysis, health-variable comparisons, correlation analysis, outlier detection, and visualization.

It provides a foundation for progressing toward healthcare analytics, biostatistics, machine learning, and healthcare data science projects.

```
```
