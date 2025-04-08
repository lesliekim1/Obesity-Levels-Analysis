# Analysis: Obesity Levels and Associated Factors

This file contains the core statistical analysis performed on the dataset to examine relationships between obesity levels and various behavioral and demographic variables.

## 1. Descriptive Statistics
**Goal**: Explore the distribution of age across gender and family history of obesity.

**Steps**:
- The dataset was sorted by `family_history_with_overweight` and `Gender`.
- Univariate analysis of `Age` was performed with plots to inspect normality.

**Key Observations**:
- Normal distribution observed in females without a family history of obesity.
- Right-skewed distribution in males with a family history of obesity.
- Individuals with a family history of obesity tend to be over 20 years old.
- Females in this group had a higher maximum age compared to others.

## 2. Correlation Analysis
**Goal**: Determine if there is a relationship between obesity levels and time using technological devices (`TUE`).

**Steps**:
- Created a numeric variable `lvl` representing obesity categories.
- Conducted a Pearson correlation between `lvl` and `TUE`.

**Results**:
- **Pearson correlation coefficient**: `-0.03435`
- **p-value**: `0.1146`

**Interpretation**:
- The correlation is weakly negative and not statistically significant.
- The null hypothesis was not rejected (p > 0.05), indicating no strong relationship between technology usage and obesity level.

## 3. Regression Analysis
**Goal**: Examine whether frequent consumption of high-calorie food (`FAVC`) predicts higher obesity levels.

**Steps**:
- Created two new variables:
  - `lvl` for obesity level (numeric: 0 to 6)
  - `freq` for frequency of high-calorie food intake (`yes` = 1, `no` = 0)
- Performed a linear regression of `lvl` on `freq`.

**Results**:
- **P-value**: `0.0001` (significant at α = 0.05)
- **R-squared**: `0.0493`

**Interpretation**:
- The model is statistically significant (p < 0.05).
- However, the R² value indicates a **weak explanatory power** — only ~5% of the variance in obesity levels is explained by high-calorie food consumption.
- Despite the weak relationship, the variable does have a measurable impact.

**Residual Analysis**:
- A univariate analysis of the residuals was conducted to assess normality and model assumptions.

## Summary

| Analysis Type        | Variable(s) Analyzed                 | Key Finding                                                      |
|----------------------|--------------------------------------|------------------------------------------------------------------|
| Descriptive Stats    | Age, Gender, Family History          | Obesity more common in individuals over 20, especially females.  |
| Correlation          | Obesity Level vs. Tech Usage (TUE)   | Weak, statistically insignificant correlation.                   |
| Regression           | Obesity Level vs. High-Calorie Food  | Statistically significant but weak predictive relationship.       |

---

## Notes
- Additional analysis could be done using more variables from the dataset. 
- Future work may include logistic regression or machine learning to explore patterns further.

