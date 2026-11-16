---
name: record-expense
description: Record an expense or a bill in QuickBooks Online (a purchase paid now, or a supplier bill to pay later). Use when the user says they bought, paid or were billed for something.
---

# Record an expense

Reply in the user's language. Writes are real bookkeeping entries: confirm before you write.

## Decide which kind

- Paid already (cash, debit card, credit card, cheque): a `Purchase`, written with `create_record`.
- Supplier bill to be paid later: a bill, written with `create-bill`.
- Paying a bill that already exists: `create_payment` is for customer payments; ask the user how they pay bills before guessing.

## Steps

1. Collect what you need: date, amount, who was paid, what it was for, how it was paid. Ask only for what is missing.
2. Look up Ids with `query`, never guess them:
   - Vendor: `SELECT Id, DisplayName FROM Vendor WHERE DisplayName LIKE '%name%'`. If it does not exist, offer to create it with `create-vendor`.
   - Expense account: `SELECT Id, Name, AccountType FROM Account WHERE AccountType = 'Expense'`.
   - Payment account (bank or card): `SELECT Id, Name FROM Account WHERE AccountType IN ('Bank', 'Credit Card')`.
3. Taxes: outside the US, read the active tax codes with `query` on `TaxCode` and ask which applies. If the user's amount includes tax, QuickBooks still treats a line amount as before tax, so work out the pre-tax amount and follow the server instructions for tax-inclusive amounts. Say the pre-tax amount and the tax before writing.
4. Show a short summary (date, vendor, account, amount, tax, payment account) and wait for a yes.
5. Write it, then tell the user the resulting record Id and total.

## Do not

- Do not invent a vendor, account or tax code Id.
- Do not record the same expense twice: if a write fails with a network error, query for it before retrying.
