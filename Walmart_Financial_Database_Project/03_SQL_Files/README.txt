WALMART FINANCIAL ANALYSIS - ORACLE FREESQL PROJECT

Run order:
1. 01_create_tables.sql
2. 02_insert_data.sql
3. 03_validation_queries.sql
4. 04_analysis_queries.sql
5. 05_create_views.sql
6. 06_dashboard_queries.sql

00_reset_project.sql is optional and deletes the project objects so you can restart.

Notes from the supplied Excel workbook:
- CIK was displayed as numeric 104169 in Excel; SQL stores it as text '0000104169' to retain the standard 10-digit CIK representation.
- Company Fiscal Year End is stored as DATE '2026-01-31' because that is the value in the Company sheet.
- Balance-sheet Total Liabilities values are inserted exactly as present in Excel, including FY2024 = 161828.
- Cash-flow signs are inserted exactly as present in Excel. Long-term debt repayments are negative, while dividends paid and share repurchases are positive.
- The Sources notes say selected cash outflows were stored as positive amounts; this does not fully match the long-term debt repayment signs in the Cash Flow Statements sheet. The SQL keeps the spreadsheet values unchanged.
