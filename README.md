# Car Model Comparison Data Pipeline

This project is a **data engineering and analysis pipeline** built on the [CarDekho Vehicle Dataset](https://www.kaggle.com/datasets/nehalbirla/vehicle-dataset-from-cardekho).
It provides tools to **compare car models** across specifications, prices, and features using structured ETL/ELT workflows and visualization dashboards.

## 🚀 Features

- **Data Ingestion**: Load raw CSV dataset into a structured workflow.
- **Data Cleaning & Preprocessing**: Handle missing values, normalize features, and prepare data.
- **ELT Pipeline with DBT & Airflow**:
  - **Airflow** orchestrates the workflow (scheduling, task dependencies).
  - **DBT** handles transformations, modeling, and documentation.
  - End-to-end data pipeline from raw input → staging → transformed → analytics layer.
- **Exploratory Data Analysis (EDA)**: Extract insights on car specs, fuel types, and prices.
- **Car Model Comparison**: Compare models based on year, mileage, transmission, and market price.
- **Visualizations**: Charts and dashboards for model-to-model comparison.

## 🎯 Goal

- Help buyers compare cars efficiently.
- Assist sellers in understanding market positioning.
- Provide analysts with a clean, structured dataset for automotive insights.
