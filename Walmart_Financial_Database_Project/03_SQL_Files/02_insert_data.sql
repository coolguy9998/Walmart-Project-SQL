-- Walmart Financial Analysis Database
-- 02 - Insert Data
-- Values transcribed from Walmart_Financial_Data_Collection.xlsx exactly as supplied.

-- COMPANY
INSERT INTO companies VALUES (
    1, 'Walmart Inc.', 'WMT', '0000104169', 'Retail',
    DATE '2026-01-31', 'USD', 'Millions'
);

-- FISCAL PERIODS
INSERT INTO fiscal_periods VALUES (2024, 1, 2024, DATE '2023-02-01', DATE '2024-01-31', DATE '2024-03-15', '10-K');
INSERT INTO fiscal_periods VALUES (2025, 1, 2025, DATE '2024-02-01', DATE '2025-01-31', DATE '2025-03-14', '10-K');
INSERT INTO fiscal_periods VALUES (2026, 1, 2026, DATE '2025-02-01', DATE '2026-01-31', DATE '2026-03-13', '10-K');

-- SEGMENTS
INSERT INTO segments VALUES (1, 1, 'Walmart U.S.');
INSERT INTO segments VALUES (2, 1, 'Walmart International');
INSERT INTO segments VALUES (3, 1, 'Sam''s Club U.S.');

-- INCOME STATEMENTS
INSERT INTO income_statements VALUES (1,2024,642637,5488,648125,490142,130971,27012,2137,21848,5578,16270,15511,1.91,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Income','USD millions ');
INSERT INTO income_statements VALUES (2,2025,674538,6447,680985,511753,139884,29348,2245,26309,6152,20157,19436,2.41,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Income','USD millions ');
INSERT INTO income_statements VALUES (3,2026,706413,6750,713163,535395,147943,29825,2431,29469,7199,22270,21893,2.73,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Income','USD millions ');

-- BALANCE SHEETS
INSERT INTO balance_sheets VALUES (1,2024,9867,8796,54892,3322,76877,110810,13673,28113,17071,252399,878,56812,28759,2212,3447,92415,36132,20033,14629,161828,83861,6488,90349,'Walmart Inc. Fiscal 2025 Form 10-K','Consolidated Balance Sheets','USD millions');
INSERT INTO balance_sheets VALUES (2,2025,9037,9975,56435,4011,79458,119993,13599,28792,12869,260823,3068,58666,29345,2299,2598,96584,33401,18748,14398,163131,91013,6408,97421,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Balance Sheets','USD millions');
INSERT INTO balance_sheets VALUES (3,2026,10727,11172,58851,4124,84874,136083,14750,28735,14103,284668,6596,63061,31187,2487,3542,107469,34624,19846,16549,178488,99617,6270,105887,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Balance Sheets','USD millions');

-- CASH FLOW STATEMENTS
INSERT INTO cash_flow_statements VALUES (1,2024,35726,20606,250,-21287,512,4967,-4217,6140,2779,-13414,69,1094,8841,9935,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Cash Flows','USD millions');
INSERT INTO cash_flow_statements VALUES (2,2025,36443,23783,432,-21379,2212,0,-3468,6688,4494,-14822,-641,-399,9935,9536,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Cash Flows','USD millions');
INSERT INTO cash_flow_statements VALUES (3,2026,41565,26642,106,-26350,3523,3983,-2625,7507,8088,-13553,123,1785,9536,11321,'Walmart Inc. Fiscal 2026 Form 10-K','Consolidated Statements of Cash Flows','USD millions');

-- SEGMENT RESULTS
INSERT INTO segment_results VALUES (1,2024,1,441817,22154,137782,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (2,2024,2,114641,4909,86136,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (3,2024,3,86179,2192,15682,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (4,2025,1,462415,23882,150006,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (5,2025,2,121885,5501,80016,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (6,2025,3,90238,2404,16862,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (7,2026,1,482975,25158,165627,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (8,2026,2,130423,5103,86093,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');
INSERT INTO segment_results VALUES (9,2026,3,93015,2442,17186,'Walmart Inc. Fiscal 2026 Form 10-K','Note 11 - Segments and Disaggregated Revenue','USD millions');

-- SOURCES
INSERT INTO data_sources VALUES (1,2024,'Income Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions except per-share data','Consolidated Statements of Income',DATE '2026-08-03','Y','Fiscal 2024 comparative information reported in the fiscal 2026 Form 10-K.');
INSERT INTO data_sources VALUES (2,2025,'Income Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions except per-share data','Consolidated Statements of Income',DATE '2026-08-03','Y','Fiscal 2025 comparative information reported in the fiscal 2026 Form 10-K.');
INSERT INTO data_sources VALUES (3,2026,'Income Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions except per-share data','Consolidated Statements of Income',DATE '2026-08-03','Y','Current-year income statement information.');
INSERT INTO data_sources VALUES (4,2024,'Balance Sheet','Walmart Inc. Fiscal 2025 Form 10-K',DATE '2025-03-14','USD millions','Consolidated Balance Sheets',DATE '2026-08-03','Y','January 31, 2024 balance sheet obtained from the comparative fiscal 2025 Form 10-K.');
INSERT INTO data_sources VALUES (5,2025,'Balance Sheet','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Consolidated Balance Sheets',DATE '2026-08-03','Y','January 31, 2025 comparative balance sheet reported in the fiscal 2026 Form 10-K.');
INSERT INTO data_sources VALUES (6,2026,'Balance Sheet','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Consolidated Balance Sheets',DATE '2026-08-03','Y','January 31, 2026 balance sheet information.');
INSERT INTO data_sources VALUES (7,2024,'Cash Flow Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Consolidated Statements of Cash Flows',DATE '2026-08-03','Y','Fiscal 2024 comparative information. Capital expenditures and selected cash outflows were stored as positive amounts for analysis.');
INSERT INTO data_sources VALUES (8,2025,'Cash Flow Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Consolidated Statements of Cash Flows',DATE '2026-08-03','Y','Fiscal 2025 comparative information. Capital expenditures and selected cash outflows were stored as positive amounts for analysis.');
INSERT INTO data_sources VALUES (9,2026,'Cash Flow Statement','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Consolidated Statements of Cash Flows',DATE '2026-08-03','Y','Current-year information. Capital expenditures and selected cash outflows were stored as positive amounts for analysis.');
INSERT INTO data_sources VALUES (10,2024,'Segment Results','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Note 11 - Segments and Disaggregated Revenue',DATE '2026-08-03','Y','Fiscal 2024 net sales, operating income, and total assets by reportable segment.');
INSERT INTO data_sources VALUES (11,2025,'Segment Results','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Note 11 - Segments and Disaggregated Revenue',DATE '2026-08-03','Y','Fiscal 2025 net sales, operating income, and total assets by reportable segment.');
INSERT INTO data_sources VALUES (12,2026,'Segment Results','Walmart Inc. Fiscal 2026 Form 10-K',DATE '2026-03-13','USD millions','Note 11 - Segments and Disaggregated Revenue',DATE '2026-08-03','Y','Fiscal 2026 net sales, operating income, and total assets by reportable segment.');

COMMIT;
