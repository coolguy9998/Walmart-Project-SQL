-- 06 - Dashboard Export Queries

-- Export/download this result for the Excel Financial Summary sheet
SELECT * FROM vw_walmart_financial_summary ORDER BY fiscal_year;

-- Export/download this result for the Excel Ratios sheet
SELECT * FROM vw_walmart_ratios ORDER BY fiscal_year;

-- Export/download this result for the Excel Segment Results sheet
SELECT * FROM vw_walmart_segment_results ORDER BY fiscal_year, segment_id;

-- Optional KPI row for FY2026
SELECT fiscal_year, total_revenues, operating_income, walmart_net_income,
       total_assets, operating_cash_flow, free_cash_flow
FROM vw_walmart_financial_summary
WHERE fiscal_year = 2026;
