
# Create healthcare dataset
set.seed(123)

df <- data.frame(
  Patient_ID = 1:100,
  Age = sample(20:75, 100, replace = TRUE),
  Gender = sample(c("Male", "Female"), 100, replace = TRUE),
  BMI = round(rnorm(100, mean = 27, sd = 5), 1),
  Glucose = round(rnorm(100, mean = 125, sd = 35)),
  Blood_Pressure = round(rnorm(100, mean = 80, sd = 12)),
  Cholesterol = round(rnorm(100, mean = 195, sd = 35)),
  Insulin = round(rnorm(100, mean = 100, sd = 45)),
  Physical_Activity = sample(
    c("Low", "Moderate", "High"),
    100,
    replace = TRUE,
    prob = c(0.3, 0.5, 0.2)
  ),
  Smoking = sample(c("Yes", "No"), 100, replace = TRUE),
  Family_History = sample(c("Yes", "No"), 100, replace = TRUE),
  HbA1c = round(rnorm(100, mean = 6.0, sd = 1.2), 1),
  Diabetes = sample(
    c("Yes", "No"),
    100,
    replace = TRUE,
    prob = c(0.35, 0.65)
  )
)

# View dataset
View(df)

# Display first rows
head(df)

# Display last rows
tail(df)

# Check dataset dimensions
dim(df)

# Check number of rows
nrow(df)

# Check number of columns
ncol(df)

# Display column names
names(df)

# Check dataset structure
str(df)

# Check data types
sapply(df, class)

# Generate summary statistics
summary(df)

# Check missing values
colSums(is.na(df))

# Check total missing values
sum(is.na(df))

# Check duplicate rows
sum(duplicated(df))

# Display duplicate rows
df[duplicated(df), ]

# Check unique genders
unique(df$Gender)

# Check unique activity levels
unique(df$Physical_Activity)

# Check unique smoking values
unique(df$Smoking)

# Check unique family history values
unique(df$Family_History)

# Check unique diabetes values
unique(df$Diabetes)

# Count gender
table(df$Gender)

# Count physical activity levels
table(df$Physical_Activity)

# Count smoking status
table(df$Smoking)

# Count family history
table(df$Family_History)

# Count diabetes status
table(df$Diabetes)

# Calculate gender percentages
prop.table(table(df$Gender)) * 100

# Calculate diabetes percentages
prop.table(table(df$Diabetes)) * 100

# Calculate activity percentages
prop.table(table(df$Physical_Activity)) * 100

# Calculate average age
mean(df$Age)

# Calculate median age
median(df$Age)

# Find minimum age
min(df$Age)

# Find maximum age
max(df$Age)

# Calculate average BMI
mean(df$BMI)

# Calculate median BMI
median(df$BMI)

# Find minimum BMI
min(df$BMI)

# Find maximum BMI
max(df$BMI)

# Calculate average glucose
mean(df$Glucose)

# Calculate median glucose
median(df$Glucose)

# Find minimum glucose
min(df$Glucose)

# Find maximum glucose
max(df$Glucose)

# Calculate average blood pressure
mean(df$Blood_Pressure)

# Calculate median blood pressure
median(df$Blood_Pressure)

# Calculate average cholesterol
mean(df$Cholesterol)

# Calculate median cholesterol
median(df$Cholesterol)

# Calculate average insulin
mean(df$Insulin)

# Calculate median insulin
median(df$Insulin)

# Calculate average HbA1c
mean(df$HbA1c)

# Calculate median HbA1c
median(df$HbA1c)

# Calculate diabetes by gender
diabetes_gender <- table(df$Gender, df$Diabetes)

diabetes_gender

# Calculate diabetes by physical activity
diabetes_activity <- table(
  df$Physical_Activity,
  df$Diabetes
)

diabetes_activity

# Calculate diabetes by smoking
diabetes_smoking <- table(
  df$Smoking,
  df$Diabetes
)

diabetes_smoking

# Calculate diabetes by family history
diabetes_family <- table(
  df$Family_History,
  df$Diabetes
)

diabetes_family

# Load dplyr
library(dplyr)

# Calculate health summary by diabetes status
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

diabetes_summary

# Calculate health summary by gender
gender_summary <- df %>%
  group_by(Gender) %>%
  summarise(
    Average_Age = mean(Age),
    Average_BMI = mean(BMI),
    Average_Glucose = mean(Glucose),
    Average_HbA1c = mean(HbA1c),
    Patient_Count = n()
  )

gender_summary

# Calculate health summary by activity
activity_summary <- df %>%
  group_by(Physical_Activity) %>%
  summarise(
    Average_BMI = mean(BMI),
    Average_Glucose = mean(Glucose),
    Average_HbA1c = mean(HbA1c),
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n()
  )

activity_summary

# Calculate family history summary
family_summary <- df %>%
  group_by(Family_History) %>%
  summarise(
    Average_Glucose = mean(Glucose),
    Average_HbA1c = mean(HbA1c),
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n()
  )

family_summary

# Calculate smoking summary
smoking_summary <- df %>%
  group_by(Smoking) %>%
  summarise(
    Average_BMI = mean(BMI),
    Average_Glucose = mean(Glucose),
    Average_HbA1c = mean(HbA1c),
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n()
  )

smoking_summary

# Filter diabetic patients
diabetic_patients <- df %>%
  filter(Diabetes == "Yes")

diabetic_patients

# Filter non-diabetic patients
non_diabetic_patients <- df %>%
  filter(Diabetes == "No")

non_diabetic_patients

# Filter patients with high glucose
high_glucose <- df %>%
  filter(Glucose > 140)

high_glucose

# Filter patients with high BMI
high_bmi <- df %>%
  filter(BMI > 30)

high_bmi

# Filter patients with high HbA1c
high_hba1c <- df %>%
  filter(HbA1c > 6.5)

high_hba1c

# Filter patients with high blood pressure
high_blood_pressure <- df %>%
  filter(Blood_Pressure > 90)

high_blood_pressure

# Calculate BMI categories
df <- df %>%
  mutate(
    BMI_Category = case_when(
      BMI < 18.5 ~ "Underweight",
      BMI < 25 ~ "Normal",
      BMI < 30 ~ "Overweight",
      TRUE ~ "Obese"
    )
  )

# Count BMI categories
table(df$BMI_Category)

# Calculate diabetes by BMI category
bmi_diabetes <- df %>%
  group_by(BMI_Category) %>%
  summarise(
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n(),
    Diabetes_Percentage = mean(Diabetes == "Yes") * 100
  )

bmi_diabetes

# Calculate age groups
df <- df %>%
  mutate(
    Age_Group = case_when(
      Age < 30 ~ "20-29",
      Age < 40 ~ "30-39",
      Age < 50 ~ "40-49",
      Age < 60 ~ "50-59",
      TRUE ~ "60+"
    )
  )

# Count age groups
table(df$Age_Group)

# Calculate diabetes by age group
age_diabetes <- df %>%
  group_by(Age_Group) %>%
  summarise(
    Diabetes_Count = sum(Diabetes == "Yes"),
    Patient_Count = n(),
    Diabetes_Percentage = mean(Diabetes == "Yes") * 100
  )

age_diabetes

# Select numerical columns
numeric_columns <- df[, c(
  "Age",
  "BMI",
  "Glucose",
  "Blood_Pressure",
  "Cholesterol",
  "Insulin",
  "HbA1c"
)]

# Create correlation matrix
correlation_matrix <- cor(numeric_columns)

correlation_matrix

# Calculate age and glucose correlation
cor(df$Age, df$Glucose)

# Calculate BMI and glucose correlation
cor(df$BMI, df$Glucose)

# Calculate BMI and HbA1c correlation
cor(df$BMI, df$HbA1c)

# Calculate glucose and HbA1c correlation
cor(df$Glucose, df$HbA1c)

# Calculate cholesterol and glucose correlation
cor(df$Cholesterol, df$Glucose)

# Calculate insulin and glucose correlation
cor(df$Insulin, df$Glucose)

# Plot age distribution
hist(
  df$Age,
  main = "Age Distribution",
  xlab = "Age",
  ylab = "Number of Patients"
)

# Plot BMI distribution
hist(
  df$BMI,
  main = "BMI Distribution",
  xlab = "BMI",
  ylab = "Number of Patients"
)

# Plot glucose distribution
hist(
  df$Glucose,
  main = "Glucose Distribution",
  xlab = "Glucose",
  ylab = "Number of Patients"
)

# Plot HbA1c distribution
hist(
  df$HbA1c,
  main = "HbA1c Distribution",
  xlab = "HbA1c",
  ylab = "Number of Patients"
)

# Plot blood pressure distribution
hist(
  df$Blood_Pressure,
  main = "Blood Pressure Distribution",
  xlab = "Blood Pressure",
  ylab = "Number of Patients"
)

# Plot diabetes count
barplot(
  table(df$Diabetes),
  main = "Diabetes Status",
  xlab = "Diabetes",
  ylab = "Number of Patients"
)

# Plot gender distribution
barplot(
  table(df$Gender),
  main = "Gender Distribution",
  xlab = "Gender",
  ylab = "Number of Patients"
)

# Plot activity distribution
barplot(
  table(df$Physical_Activity),
  main = "Physical Activity",
  xlab = "Activity Level",
  ylab = "Number of Patients"
)

# Plot diabetes by BMI category
barplot(
  table(df$BMI_Category, df$Diabetes),
  beside = TRUE,
  main = "Diabetes by BMI Category",
  xlab = "BMI Category",
  ylab = "Number of Patients",
  legend.text = TRUE
)

# Plot diabetes by age group
barplot(
  table(df$Age_Group, df$Diabetes),
  beside = TRUE,
  main = "Diabetes by Age Group",
  xlab = "Age Group",
  ylab = "Number of Patients",
  legend.text = TRUE
)

# Plot glucose by diabetes status
boxplot(
  Glucose ~ Diabetes,
  data = df,
  main = "Glucose by Diabetes Status",
  xlab = "Diabetes",
  ylab = "Glucose"
)

# Plot BMI by diabetes status
boxplot(
  BMI ~ Diabetes,
  data = df,
  main = "BMI by Diabetes Status",
  xlab = "Diabetes",
  ylab = "BMI"
)

# Plot HbA1c by diabetes status
boxplot(
  HbA1c ~ Diabetes,
  data = df,
  main = "HbA1c by Diabetes Status",
  xlab = "Diabetes",
  ylab = "HbA1c"
)

# Plot glucose versus HbA1c
plot(
  df$Glucose,
  df$HbA1c,
  main = "Glucose vs HbA1c",
  xlab = "Glucose",
  ylab = "HbA1c",
  pch = 19
)

# Add regression line
abline(
  lm(HbA1c ~ Glucose, data = df)
)

# Plot BMI versus glucose
plot(
  df$BMI,
  df$Glucose,
  main = "BMI vs Glucose",
  xlab = "BMI",
  ylab = "Glucose",
  pch = 19
)

# Add regression line
abline(
  lm(Glucose ~ BMI, data = df)
)

# Plot age versus glucose
plot(
  df$Age,
  df$Glucose,
  main = "Age vs Glucose",
  xlab = "Age",
  ylab = "Glucose",
  pch = 19
)

# Add regression line
abline(
  lm(Glucose ~ Age, data = df)
)

# Detect BMI outliers
boxplot(df$BMI)$out

# Detect glucose outliers
boxplot(df$Glucose)$out

# Detect blood pressure outliers
boxplot(df$Blood_Pressure)$out

# Detect cholesterol outliers
boxplot(df$Cholesterol)$out

# Detect insulin outliers
boxplot(df$Insulin)$out

# Detect HbA1c outliers
boxplot(df$HbA1c)$out

# Calculate BMI quartiles
quantile(df$BMI)

# Calculate glucose quartiles
quantile(df$Glucose)

# Calculate HbA1c quartiles
quantile(df$HbA1c)

# Save dataset
write.csv(
  df,
  "healthcare_diabetes_data.csv",
  row.names = FALSE
)

# Print completion message
print("Healthcare EDA completed successfully!")
