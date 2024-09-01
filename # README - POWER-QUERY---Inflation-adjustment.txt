ChatGPT conversation 

******

You said:
How to create in Power Query a calculated column that uses the below 3 columns :
- Yearly inflation percentage for every year (e.g. 1973 - 3%)
- Year of sale
- Sale price 

And creates a 4th "ADJUSTED SALE PRICE" to 2024, so every sale price will get adjusted to inflation? 
ChatGPT said:
ChatGPT
To create an "ADJUSTED SALE PRICE" column in Power Query that accounts for yearly inflation up to 2024, you'll follow these steps:

Step 1: Prepare Your Data
Assume you have a table with the following columns:

Yearly Inflation: Contains the inflation percentage for each year (e.g., 3% for 1973, 4% for 1974).
Year of Sale: The year when the sale occurred (e.g., 1973).
Sale Price: The original sale price.
Step 2: Create a List of Inflation Rates
Create a New Query for Inflation Data:

If your yearly inflation data is in the same table, you can extract it into a new table. Otherwise, load it into Power Query as a separate query.
Ensure this query has two columns: Year and Inflation Rate.
Calculate Cumulative Inflation:

You need to calculate the cumulative inflation from the sale year to 2024.
Use the following steps:
Step 3: Apply the Calculation to Adjust Sale Price
Create a New Column for Adjusted Price:

Go back to your main table that has the Year of Sale and Sale Price.
Merge Queries:

Merge your main table with the inflation data using the Year of Sale column. This step will bring the relevant inflation rate into your main table.
Cumulative Inflation Calculation:

After merging, you need to apply a cumulative inflation adjustment.
Use the formula below to calculate the adjusted price for each sale:
m
Copy code
= Table.AddColumn(
    PreviousStep, 
    "Cumulative Inflation", 
    each List.Product(
        List.Transform(
            Table.SelectRows(
                InflationTable, 
                each [Year] > [Year of Sale] and [Year] <= 2024
            )[Inflation Rate], 
            each 1 + _ / 100
        )
    )
)
This formula calculates the product of (1 + inflation rate) for every year between the Year of Sale and 2024.
Calculate Adjusted Sale Price:

Add another column using the cumulative inflation factor to adjust the original sale price:
m
Copy code
= Table.AddColumn(
    PreviousStep,
    "ADJUSTED SALE PRICE",
    each [Sale Price] * [Cumulative Inflation]
)
Step 4: Finalize and Load
Review the calculated "ADJUSTED SALE PRICE" and ensure it correctly reflects the inflation-adjusted sale price up to 2024.
Load the data back to your Excel sheet or data model.
Example
Let’s assume the following example:

Yearly Inflation	Year of Sale	Sale Price
3%	1973	$100,000
Cumulative Inflation from 1973 to 2024 might be something like 15 (based on the yearly rates you have).
The Adjusted Sale Price would then be:
Adjusted Sale Price
=
100
,
000
×
15
=
1
,
500
,
000
Adjusted Sale Price=100,000×15=1,500,000
By following these steps, you'll have a dynamically calculated column that adjusts the sale price according to inflation rates up to 2024.










Message ChatGPT

ChatGPT can make mistakes. Check important info.
