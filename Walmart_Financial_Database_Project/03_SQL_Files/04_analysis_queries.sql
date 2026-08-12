-- 04 - Financial Analysis Queries

-- 1. Three-year financial summary
SELECT f.fiscal_year,
       i.net_sales,
       i.total_revenues,
       i.operating_income,
       i.net_income_attributable_walmart AS walmart_net_income,
       i.diluted_eps,
       b.total_assets,
       b.total_current_assets,
       b.total_current_liabilities,
       cf.operating_cash_flow,
       cf.capital_expenditures,
       cf.operating_cash_flow - cf.capital_expenditures AS free_cash_flow
FROM fiscal_periods f
JOIN income_statements i ON i.period_id=f.period_id
JOIN balance_sheets b ON b.period_id=f.period_id
JOIN cash_flow_statements cf ON cf.period_id=f.period_id
ORDER BY f.fiscal_year;

-- 2. Year-over-year revenue growth
SELECT fiscal_year, total_revenues,
       ROUND((total_revenues - prior_revenue) / NULLIF(prior_revenue,0) * 100, 2) AS revenue_growth_pct
FROM (
    SELECT f.fiscal_year, i.total_revenues,
           LAG(i.total_revenues) OVER (ORDER BY f.fiscal_year) AS prior_revenue
    FROM fiscal_periods f
    JOIN income_statements i ON i.period_id=f.period_id
)
ORDER BY fiscal_year;

-- 3. Profitability margins
SELECT f.fiscal_year,
       ROUND(i.operating_income / NULLIF(i.total_revenues,0) * 100, 2) AS operating_margin_pct,
       ROUND(i.net_income_attributable_walmart / NULLIF(i.total_revenues,0) * 100, 2) AS net_margin_pct
FROM fiscal_periods f
JOIN income_statements i ON i.period_id=f.period_id
ORDER BY f.fiscal_year;

-- 4. Liquidity and working-capital indicators
SELECT f.fiscal_year,
       ROUND(b.total_current_assets / NULLIF(b.total_current_liabilities,0), 2) AS current_ratio,
       ROUND((b.cash_and_equivalents + b.receivables) / NULLIF(b.total_current_liabilities,0), 2) AS quick_ratio,
       b.inventories,
       b.accounts_payable
FROM fiscal_periods f
JOIN balance_sheets b ON b.period_id=f.period_id
ORDER BY f.fiscal_year;

-- 5. Free cash flow and FCF margin
SELECT f.fiscal_year,
       cf.operating_cash_flow,
       cf.capital_expenditures,
       cf.operating_cash_flow - cf.capital_expenditures AS free_cash_flow,
       ROUND((cf.operating_cash_flow - cf.capital_expenditures) / NULLIF(i.total_revenues,0) * 100, 2) AS free_cash_flow_margin_pct
FROM fiscal_periods f
JOIN cash_flow_statements cf ON cf.period_id=f.period_id
JOIN income_statements i ON i.period_id=f.period_id
ORDER BY f.fiscal_year;

-- 6. Segment performance
SELECT f.fiscal_year,
       s.segment_name,
       sr.net_sales,
       sr.operating_income,
       sr.total_assets,
       ROUND(sr.operating_income / NULLIF(sr.net_sales,0) * 100, 2) AS segment_operating_margin_pct,
       ROUND(sr.net_sales / NULLIF(i.net_sales,0) * 100, 2) AS share_of_consolidated_net_sales_pct
FROM segment_results sr
JOIN fiscal_periods f ON f.period_id=sr.period_id
JOIN segments s ON s.segment_id=sr.segment_id
JOIN income_statements i ON i.period_id=sr.period_id
ORDER BY f.fiscal_year, s.segment_id;

-- 7. Segment sales growth using LAG by segment
SELECT fiscal_year, segment_name, net_sales,
       ROUND((net_sales-prior_sales)/NULLIF(prior_sales,0)*100,2) AS segment_sales_growth_pct
FROM (
    SELECT f.fiscal_year, s.segment_id, s.segment_name, sr.net_sales,
           LAG(sr.net_sales) OVER (PARTITION BY s.segment_id ORDER BY f.fiscal_year) AS prior_sales
    FROM segment_results sr
    JOIN fiscal_periods f ON f.period_id=sr.period_id
    JOIN segments s ON s.segment_id=sr.segment_id
)
ORDER BY fiscal_year, segment_id;

-- 8. Asset growth
SELECT fiscal_year, total_assets,
       ROUND((total_assets-prior_assets)/NULLIF(prior_assets,0)*100,2) AS asset_growth_pct
FROM (
    SELECT f.fiscal_year, b.total_assets,
           LAG(b.total_assets) OVER (ORDER BY f.fiscal_year) AS prior_assets
    FROM fiscal_periods f
    JOIN balance_sheets b ON b.period_id=f.period_id
)
ORDER BY fiscal_year;
