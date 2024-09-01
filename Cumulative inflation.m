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
