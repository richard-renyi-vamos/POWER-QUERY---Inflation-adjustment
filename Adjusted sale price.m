= Table.AddColumn(
    PreviousStep,
    "ADJUSTED SALE PRICE",
    each [Sale Price] * [Cumulative Inflation]
)
