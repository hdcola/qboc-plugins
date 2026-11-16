---
name: create-invoice
description: Create, find or update customer invoices and record income in QuickBooks Online. Use for billing a customer, checking who owes money, or recording a sale paid right away.
---

# Invoices and income

Reply in the user's language. Writes are real bookkeeping entries: confirm before you write.

## Pick the right record

- Customer will pay later: an invoice, `create_invoice`.
- Customer paid now: a sales receipt, `create_sales_receipt`.
- A customer paid an existing invoice: `create_payment`, linked to the invoice.
- Find invoices: `search_invoices`, or `query` such as `SELECT * FROM Invoice WHERE Balance > '0' ORDERBY DueDate`.

## Creating an invoice

1. Find or create the customer: `query` on `Customer` by `DisplayName`; create with `create_record` (entity `Customer`) if missing, after asking.
2. Find the items (products or services): `SELECT Id, Name, UnitPrice FROM Item`. Each line needs an item.
3. Taxes: US companies use `TAX` or `NON` on lines. Other countries need a `TaxCode` Id on every line: list them with `query` on `TaxCode` and ask which applies. Do not guess.
4. Show the user: customer, each line (item, quantity, price, tax), total, invoice date and due date. Wait for a yes.
5. Create it and report the invoice number and total.

## Changing an invoice

Use the update tool after reading the current record, because updates need the current `SyncToken`. Never edit a paid invoice without telling the user what will change.

Voiding or deleting an invoice: follow the `safe-delete-and-void` skill.
