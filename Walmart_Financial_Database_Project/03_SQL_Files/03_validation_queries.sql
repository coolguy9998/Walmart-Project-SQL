-- 03 - Validation Queries

-- A. Record counts
SELECT 'COMPANIES' table_name, COUNT(*) record_count FROM companies
UNION ALL SELECT 'FISCAL_PERIODS', COUNT(*) FROM fiscal_periods
UNION ALL SELECT 'INCOME_STATEMENTS', COUNT(*) FROM income_statements
UNION ALL SELECT 'BALANCE_SHEETS', COUNT(*) FROM balance_sheets
UNION ALL SELECT 'CASH_FLOW_STATEMENTS', COUNT(*) FROM cash_flow_statements
UNION ALL SELECT 'SEGMENTS', COUNT(*) FROM segments
UNION ALL SELECT 'SEGMENT_RESULTS', COUNT(*) FROM segment_results
UNION ALL SELECT 'DATA_SOURCES', COUNT(*) FROM data_sources;

-- Expected: 1, 3, 3, 3, 3, 3, 9, 12 respectively.

-- B. Revenue equation: Net Sales + Membership/Other = Total Revenues
SELECT period_id, net_sales, membership_other_income, total_revenues,
       net_sales + membership_other_income - total_revenues AS difference
FROM income_statements
ORDER BY period_id;

-- C. Operating income equation
SELECT period_id, total_revenues, cost_of_sales, operating_sga_expenses, operating_income,
       total_revenues - cost_of_sales - operating_sga_expenses - operating_income AS difference
FROM income_statements
ORDER BY period_id;

-- D. Cash roll-forward
SELECT period_id, beginning_cash, net_change_in_cash, ending_cash,
       beginning_cash + net_change_in_cash - ending_cash AS difference
FROM cash_flow_statements
ORDER BY period_id;

-- E. Segment net sales should reconcile to consolidated net sales
SELECT sr.period_id,
       SUM(sr.net_sales) AS segment_net_sales,
       i.net_sales AS consolidated_net_sales,
       SUM(sr.net_sales) - i.net_sales AS difference
FROM segment_results sr
JOIN income_statements i ON i.period_id = sr.period_id
GROUP BY sr.period_id, i.net_sales
ORDER BY sr.period_id;

-- F. Foreign-key/orphan checks (all should return 0 rows)
SELECT i.* FROM income_statements i LEFT JOIN fiscal_periods f ON f.period_id=i.period_id WHERE f.period_id IS NULL;
SELECT b.* FROM balance_sheets b LEFT JOIN fiscal_periods f ON f.period_id=b.period_id WHERE f.period_id IS NULL;
SELECT c.* FROM cash_flow_statements c LEFT JOIN fiscal_periods f ON f.period_id=c.period_id WHERE f.period_id IS NULL;
SELECT sr.* FROM segment_results sr LEFT JOIN fiscal_periods f ON f.period_id=sr.period_id WHERE f.period_id IS NULL;
SELECT sr.* FROM segment_results sr LEFT JOIN segments s ON s.segment_id=sr.segment_id WHERE s.segment_id IS NULL;

-- G. Source verification flags
SELECT verified, COUNT(*) AS source_count
FROM data_sources
GROUP BY verified;
