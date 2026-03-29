# Individual Traits Linked to Climate Change Concern in the Netherlands

A quantitative analysis of individual-level predictors of climate change concern among Dutch residents, using European Social Survey (ESS) Round 11 data.

## Overview

Despite low overall rates of climate scepticism in the Netherlands, a meaningful share of the population displays indifference or reservation toward climate change severity. This project investigates which individual traits — political ideology, social trust, education, gender, age, income, and political interest — are associated with variation in climate change concern.

## Data

- **Source:** [European Social Survey (ESS) Round 11](https://www.europeansocialsurvey.org/)
- **Country:** Netherlands
- **Respondents:** 1,421 (after listwise deletion of missing values)
- **Fieldwork period:** 31 March 2023 – 11 July 2023

> The ESS dataset is publicly available via the ESS Data Portal. The raw `.dta` file is not included in this repository. Download it directly from the ESS website and place it in the project folder before running the script.

## Key Variables

| Variable | Description | Scale |
|---|---|---|
| `concern` | Climate change concern (dependent) | 1–5 |
| `ideology` | Left–right self-placement | 0 (left) – 10 (right) |
| `trust` | Generalised social trust | 0–10 |
| `age` | Age in years | 15–90 |
| `income` | Household income decile | 1–10 |
| `polinterest` | Political interest | 1–4 |
| `female` | Gender dummy | 0/1 |
| `edu_tertiary` | Tertiary education dummy (ISCED 5+) | 0/1 |

## Methods

- Missing value recoding (refusal/don't know codes set to `.`)
- Dummy variable construction for gender and education
- Descriptive statistics and bivariate t-test (education × concern)
- Two OLS regression models with robust standard errors
- Variance Inflation Factor (VIF) check for multicollinearity

## Key Findings

- **Political ideology** is the strongest predictor: a one-point shift to the right corresponds to a 0.13-point decrease in concern (β = −0.131, p < 0.001)
- **Tertiary education** is positively associated with concern (β = 0.294, p < 0.001)
- **Political interest** is negatively associated with concern (β = −0.187, p < 0.001), where higher values indicate lower engagement
- **Women** report significantly higher concern than men (β = 0.111, p = 0.016)
- **Compassion** (social trust proxy) loses significance once controls are added
- All VIF values < 1.35, indicating no multicollinearity concern

## Files

| File | Description |
|---|---|
| `analysis.do` | Full Stata script: data cleaning, variable construction, descriptive stats, regressions, table export |
| `results_table.docx` | Exported regression table (Models 1 & 2) |
| `README.md` | This file |

## How to Run

1. Download the ESS Round 11 Netherlands dataset (`.dta`) from [europeansocialsurvey.org](https://www.europeansocialsurvey.org/)
2. Update the file path in line 1 of `analysis.do` to match your local directory
3. Open `analysis.do` in Stata and run from top to bottom

## Author

Devin Frey — [github.com/dfrey3564](https://github.com/dfrey3564)  
MSc Environment and Resource Management, Vrije Universiteit Amsterdam  
Master of Public Health, Southern New Hampshire University
