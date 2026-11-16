---
name: run-reports
description: Run and explain QuickBooks Online reports such as profit and loss, balance sheet, cash flow and aged receivables. Use for questions about how the business is doing, who owes money, or what was spent.
---

# Reports

Reply in the user's language. Reports are read-only.

## Steps

1. Pick the report with `get_report`: `ProfitAndLoss`, `BalanceSheet`, `CashFlow`, `AgedReceivables`, `AgedPayables`, `TrialBalance`, `GeneralLedger`, `CustomerBalance`, `VendorExpenses`, `TransactionList`.
2. Set the period explicitly, for example `{"start_date": "2026-01-01", "end_date": "2026-03-31"}` or `{"date_macro": "Last Month"}`. Ask if it is unclear. Say which period you used when you answer.
3. Accounting method matters: ask whether the user wants Cash or Accrual if the answer depends on it (`{"accounting_method": "Cash"}`). QuickBooks uses the company default if you do not set it; say so.
4. Explain in plain language: totals first, then the largest items, then anything unusual. Compare with a previous period if the user asks, by running the report twice.
5. For detail behind a number, use the matching detail report or `query`.

## Do not

- Do not do arithmetic across reports you did not run; run the report instead.
- Do not present figures as tax or legal advice.
