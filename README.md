# Obesity Levels Data Analysis

## Project Overview
This SAS project analyzes a dataset on obesity levels collected from individuals in Mexico, Peru, and Colombia. The dataset includes various behavioral, demographic, and physiological variables. The goal is to identify significant factors associated with obesity and understand the potential impact of family history, technology usage, and dietary habits.

## Dataset
- **Source**: [Estimation of Obesity Levels Based on Eating Habits and Physical Condition - UCI Dataset](https://archive.ics.uci.edu/dataset/544/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition)
- **Variables** include:
  - Obesity level classifications (e.g., Normal, Overweight, Obesity Type I/II/III)
  - Family history of overweight
  - Gender
  - Age
  - Time spent using technological devices (TUE)
  - Frequency of consumption of highly caloric food (FAVC)

## Data Processing Overview
1. **Data Import & Preparation**
   - The CSV file is imported into SAS.
   - The dataset is sorted by family history and gender.

2. **Descriptive Statistics**
   - Univariate analysis of `Age`, grouped by `family_history_with_overweight` and `Gender`.

3. **Correlation Analysis**
   - A new numeric variable `lvl` is created to encode obesity levels.
   - Pearson correlation is computed between `lvl` and `TUE`.

4. **Regression Analysis**
   - Another variable `freq` is created to encode frequency of high-calorie food intake (FAVC).
   - A regression model analyzes the relationship between `lvl` and `freq`.
   - Residual analysis is performed to assess model fit.

For full results, statistical outputs, and interpretations, see the [ANALYSIS.md](github.com/lesliekim1/Obesity-Levels-Analysis/blob/main/Analysis.md) file.

## How to Run
1. **Install SAS** or use SAS OnDemand for Academics.
2. **Download the dataset** from the UCI Machine Learning Repository and place the CSV file in an accessible directory.
3. **Open the provided `.sas` file** in SAS.
4. **Edit the `datafile` path** in the `proc import` step to match the location of your CSV file:
   ```sas
   datafile = "your\\path\\to\\ObesityDataSet_raw_and_data_sinthetic.csv"

## References
- [Estimation of Obesity Levels Based on Eating Habits and Physical Condition - UCI Dataset](https://archive.ics.uci.edu/dataset/544/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition)
- [NHLBI - Causes and Risk Factors for Obesity](https://www.nhlbi.nih.gov/health/overweight-and-obesity/causes)
- [CDC - Heart Disease Risk Factors](https://www.cdc.gov/heart-disease/risk-factors/index.html)
