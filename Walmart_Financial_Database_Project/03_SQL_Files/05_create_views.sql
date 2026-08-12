-- 05 - Create Views

CREATE OR REPLACE VIEW vw_walmart_financial_summary AS
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
JOIN cash_flow_statements cf ON cf.period_id=f.period_id;

CREATE OR REPLACE VIEW vw_walmart_ratios AS
SELECT f.fiscal_year,
       ROUND(i.operating_income / NULLIF(i.total_revenues,0) * 100, 2) AS operating_margin_pct,
       ROUND(i.net_income_attributable_walmart / NULLIF(i.total_revenues,0) * 100, 2) AS net_margin_pct,
       ROUND(b.total_current_assets / NULLIF(b.total_current_liabilities,0), 2) AS current_ratio,
       ROUND((b.cash_and_equivalents+b.receivables) / NULLIF(b.total_current_liabilities,0), 2) AS quick_ratio,
       ROUND(cf.operating_cash_flow / NULLIF(i.total_revenues,0) * 100, 2) AS operating_cash_flow_margin_pct,
       ROUND((cf.operating_cash_flow-cf.capital_expenditures) / NULLIF(i.total_revenues,0) * 100, 2) AS free_cash_flow_margin_pct
FROM fiscal_periods f
JOIN income_statements i ON i.period_id=f.period_id
JOIN balance_sheets b ON b.period_id=f.period_id
JOIN cash_flow_statements cf ON cf.period_id=f.period_id;

CREATE OR REPLACE VIEW vw_walmart_segment_results AS
SELECT f.fiscal_year,
       s.segment_id,
       s.segment_name,
       sr.net_sales,
       sr.operating_income,
       sr.total_assets,
       ROUND(sr.operating_income / NULLIF(sr.net_sales,0) * 100, 2) AS operating_margin_pct
FROM segment_results sr
JOIN fiscal_periods f ON f.period_id=sr.period_id
JOIN segments s ON s.segment_id=sr.segment_id;
