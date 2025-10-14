## Power BI Visualization

This section explains how to visualize the **dbt-transformed data** using  **Power BI**.

### 1. Connect to the Database

Use a direct connection to your **PostgreSQL** database

**2. Load Only the Final Models**

Load the **final mart tables** produced by dbt:

| Model            | Purpose                                               |
| ---------------- | ----------------------------------------------------- |
| `fact_listing` | Main fact table containing car listings and measures. |
| `dim_car`      | Dimension table for make, model, and year.            |
| `dim_date`     | Standard calendar dimension for time-based analysis   |

Create relationships in Power BI as follows:

| From (Fact)               | To (Dimension)        | Relationship | Direction |
| ------------------------- | --------------------- | ------------ | --------- |
| `fact_listing.car_sk`   | `dim_car.car_sk`    | Many-to-One  | Single    |
| `fact_listing.date_key` | `dim_date.date_key` | Many-to-One  | Single    |

> **Note:** The `date_key` in `fact_listing` should be derived from a timestamp column such as `_ingested_at`:
>
> <pre class="overflow-visible!" data-start="1772" data-end="1837"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-sql"><span><span>to_char(_ingested_at, </span><span>'YYYYMMDD'</span><span>)::</span><span>int</span><span></span><span>as</span><span> date_key
> </span></span></code></div></div></pre>

### 4. Create Measures

Define the following **DAX measures** in Power BI:

<pre class="overflow-visible!" data-start="1914" data-end="2057"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-DAX"><span>Total Listings = COUNTROWS('fact_listing')
Avg Price = AVERAGE('fact_listing'[price])
Avg Mileage = AVERAGE('fact_listing'[mileage])
</span></code></div></div></pre>

These measures enable high-level KPIs and trend analysis and the key here is to ask the right questions.

### 5. Build Visualizations

Use the following visual types to represent insights effectively:

| Visual                     | Purpose                                                                         |
| -------------------------- | ------------------------------------------------------------------------------- |
| **Card**             | Display key metrics such as total listings, average price, and average mileage. |
| **Bar/Column Chart** | Compare prices or listing counts by `make`or `model`.                       |
| **Line Chart**       | Analyze price or mileage trends over time using the `dim_date`table.          |
| **Slicers**          | Filter data by `year`,`make`,`country`, or other dimension attributes.    |
