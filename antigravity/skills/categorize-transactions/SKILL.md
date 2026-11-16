---
name: categorize-transactions
description: Find transactions sitting in Uncategorized accounts in QuickBooks Online and move them to the right account, after the user confirms. Use for cleaning up books or reclassifying expenses and deposits.
---

# Categorize transactions

Reply in the user's language.

## What this can and cannot do

The QuickBooks API does not expose the bank feed's "For review" queue, so you cannot see or accept pending bank feed items. You can fix transactions that are **already recorded** in QuickBooks but sit in an uncategorized or wrong account. Say this to the user if they ask for the bank feed.

## Steps

1. Find the accounts: `SELECT Id, Name, AccountType FROM Account WHERE Name LIKE '%Uncategorized%'`.
2. List candidates, limited to a date range the user chose:
   - Expenses: `SELECT * FROM Purchase WHERE TxnDate >= '2026-01-01'`, then keep those whose lines use an uncategorized account.
   - Deposits: the same with `Deposit`.
3. Propose a category for each, using the payee, the memo and how the user categorized similar transactions before. Present a table: date, payee, amount, current account, proposed account. Mark the ones you are unsure about.
4. Wait for the user to approve, change or skip each one. Do not bulk-write on a general "looks fine" unless they approved the whole table.
5. Apply each approved change with `update_record` (read the record first for its `SyncToken`; a sparse update changes only the line's account).
6. Summarize what changed, and what was skipped.

## Do not

- Do not change a transaction that has been reconciled without telling the user.
- Do not touch transactions outside the agreed date range.
