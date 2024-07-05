# EDA-Project-Loan

## Overview

This repository contains the code and data for performing Exploratory Data Analysis (EDA) on a loan dataset. The analysis includes loading and cleaning the data, univariate analysis, bivariate analysis, and multivariate analysis to understand the relationships and patterns in the data.

## Dataset

The dataset used for this project is `loan 2.csv`, which contains various features related to loans.

## Analysis Steps

### 1. Load and Study the Data
- The dataset is loaded into a pandas DataFrame.
- Initial exploration of the dataset, including checking for null values and basic statistical summaries.

### 2. Handle Missing Values
- Identify and handle missing values in the dataset.

### 3. Handle Outliers
- Identify and handle outliers in the numerical columns.

### 4. Univariate Analysis
- Summary statistics for numerical features: mean, median, mode, range, variance, standard deviation, skewness, and kurtosis.
- Histograms for numerical data.
- Bar plots for categorical data.

### 5. Bivariate Analysis
- Box plots and violin plots for numerical data across numerical data.
- Scatter plots for numerical data.

### 6. Multivariate Analysis
- **Correlation Matrix**: Shows the correlation coefficients between pairs of numerical variables.
- **Heatmap**: Visual representation of the correlation matrix.
- **Scatter Plot Matrix (Pair Plot)**: Grid of scatter plots that show relationships between pairs of numerical variables.
- **Principal Component Analysis (PCA)**: Reduces the dimensionality of the data while retaining most of the variance.

## Getting Started

### Prerequisites

To run the analysis, you need to have the following Python libraries installed:
- pandas
- numpy
- matplotlib
- seaborn
- scipy
- scikit-learn

### Results

The results of the analysis include various visualizations and statistical summaries that help in understanding the data better. These include:

- Histograms and bar plots for univariate analysis.
- Box plots and violin plots for bivariate analysis.
- Correlation heatmaps, scatter plot matrices, and PCA results for multivariate analysis.

### Acknowledgements

This project was inspired by the need to understand and analyze loan data more effectively given by bootcamp program of futurense company. 
Special thanks to the data provider Ziyaad sir (https://github.com/ziyaad123) and the open-source community for their valuable tools and libraries.

### Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request. 
Contributions are welcome!


