---
name: safe-delete-and-void
description: Delete or void a record in QuickBooks Online safely. Use whenever the user wants to delete, remove, cancel or void a transaction or customer.
---

# Deleting and voiding

Both actions are permanent. Reply in the user's language.

## Steps

1. Identify the exact record: read it with `get_record` (you need its current `SyncToken` for the call) and show the user its type, number, date, counterparty and amount.
2. Choose the action:
   - `void_record`: keeps the transaction with a zero amount, for invoices, sales receipts, payments and bill payments. Prefer this for anything that has already been sent or paid, because it keeps the audit trail.
   - `delete_record`: removes the transaction completely.
   - Customers, vendors, items and accounts cannot be deleted; make them inactive instead (`update-vendor` for a vendor, `update_record` with `Active` set to false for the others). Say that.
3. Say what will happen and that it cannot be undone. Wait for an explicit yes for this record. A yes to an earlier record is not a yes to this one.
4. Do one record at a time unless the user approved a specific list.
5. Report the result.

## When the tools are missing

Deleting and voiding can be turned off per company by the user. If `delete_record` and `void_record` are not available, tell the user they can turn them on for this company on their qlink Launch page, or do it directly in QuickBooks. Do not look for a workaround.
