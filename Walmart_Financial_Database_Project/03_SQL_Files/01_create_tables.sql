-- Walmart Financial Analysis Database
-- 01 - Create Tables
-- Source: Walmart_Financial_Data_Collection.xlsx

CREATE TABLE companies (
    company_id NUMBER PRIMARY KEY,
    company_name VARCHAR2(100) NOT NULL,
    ticker VARCHAR2(10) NOT NULL,
    cik_number VARCHAR2(20) NOT NULL,
    industry VARCHAR2(100),
    fiscal_year_end DATE,
    reporting_currency VARCHAR2(10),
    reporting_unit VARCHAR2(30)
);

CREATE TABLE fiscal_periods (
    period_id NUMBER PRIMARY KEY,
    company_id NUMBER NOT NULL,
    fiscal_year NUMBER(4) NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    filing_date DATE NOT NULL,
    form_type VARCHAR2(20),
    CONSTRAINT fk_fp_company FOREIGN KEY (company_id) REFERENCES companies(company_id),
    CONSTRAINT uq_fp_company_year UNIQUE (company_id, fiscal_year)
);

CREATE TABLE income_statements (
    income_statement_id NUMBER PRIMARY KEY,
    period_id NUMBER NOT NULL UNIQUE,
    net_sales NUMBER(18,2),
    membership_other_income NUMBER(18,2),
    total_revenues NUMBER(18,2),
    cost_of_sales NUMBER(18,2),
    operating_sga_expenses NUMBER(18,2),
    operating_income NUMBER(18,2),
    interest_expense NUMBER(18,2),
    income_before_taxes NUMBER(18,2),
    income_tax_expense NUMBER(18,2),
    consolidated_net_income NUMBER(18,2),
    net_income_attributable_walmart NUMBER(18,2),
    diluted_eps NUMBER(10,2),
    source_filing VARCHAR2(150),
    source_section VARCHAR2(150),
    unit VARCHAR2(100),
    CONSTRAINT fk_is_period FOREIGN KEY (period_id) REFERENCES fiscal_periods(period_id)
);

CREATE TABLE balance_sheets (
    balance_sheet_id NUMBER PRIMARY KEY,
    period_id NUMBER NOT NULL UNIQUE,
    cash_and_equivalents NUMBER(18,2),
    receivables NUMBER(18,2),
    inventories NUMBER(18,2),
    prepaid_and_other NUMBER(18,2),
    total_current_assets NUMBER(18,2),
    property_and_equipment NUMBER(18,2),
    operating_lease_assets NUMBER(18,2),
    goodwill NUMBER(18,2),
    other_long_term_assets NUMBER(18,2),
    total_assets NUMBER(18,2),
    short_term_borrowings NUMBER(18,2),
    accounts_payable NUMBER(18,2),
    accrued_liabilities NUMBER(18,2),
    current_lease_obligations NUMBER(18,2),
    current_debt NUMBER(18,2),
    total_current_liabilities NUMBER(18,2),
    long_term_debt NUMBER(18,2),
    long_term_lease_obligations NUMBER(18,2),
    deferred_tax_other NUMBER(18,2),
    total_liabilities NUMBER(18,2),
    walmart_shareholders_equity NUMBER(18,2),
    noncontrolling_interest NUMBER(18,2),
    total_equity NUMBER(18,2),
    source_filing VARCHAR2(150),
    source_section VARCHAR2(150),
    unit VARCHAR2(100),
    CONSTRAINT fk_bs_period FOREIGN KEY (period_id) REFERENCES fiscal_periods(period_id)
);

CREATE TABLE cash_flow_statements (
    cash_flow_id NUMBER PRIMARY KEY,
    period_id NUMBER NOT NULL UNIQUE,
    operating_cash_flow NUMBER(18,2),
    capital_expenditures NUMBER(18,2),
    asset_disposal_proceeds NUMBER(18,2),
    investing_cash_flow NUMBER(18,2),
    short_term_borrowing_net NUMBER(18,2),
    long_term_debt_proceeds NUMBER(18,2),
    long_term_debt_repayments NUMBER(18,2),
    dividends_paid NUMBER(18,2),
    share_repurchases NUMBER(18,2),
    financing_cash_flow NUMBER(18,2),
    exchange_rate_effect NUMBER(18,2),
    net_change_in_cash NUMBER(18,2),
    beginning_cash NUMBER(18,2),
    ending_cash NUMBER(18,2),
    source_filing VARCHAR2(150),
    source_section VARCHAR2(150),
    unit VARCHAR2(100),
    CONSTRAINT fk_cf_period FOREIGN KEY (period_id) REFERENCES fiscal_periods(period_id)
);

CREATE TABLE segments (
    segment_id NUMBER PRIMARY KEY,
    company_id NUMBER NOT NULL,
    segment_name VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_seg_company FOREIGN KEY (company_id) REFERENCES companies(company_id),
    CONSTRAINT uq_seg_company_name UNIQUE (company_id, segment_name)
);

CREATE TABLE segment_results (
    result_id NUMBER PRIMARY KEY,
    period_id NUMBER NOT NULL,
    segment_id NUMBER NOT NULL,
    net_sales NUMBER(18,2),
    operating_income NUMBER(18,2),
    total_assets NUMBER(18,2),
    source_filing VARCHAR2(150),
    source_section VARCHAR2(150),
    unit VARCHAR2(100),
    CONSTRAINT fk_sr_period FOREIGN KEY (period_id) REFERENCES fiscal_periods(period_id),
    CONSTRAINT fk_sr_segment FOREIGN KEY (segment_id) REFERENCES segments(segment_id),
    CONSTRAINT uq_sr_period_segment UNIQUE (period_id, segment_id)
);

CREATE TABLE data_sources (
    source_id NUMBER PRIMARY KEY,
    period_id NUMBER NOT NULL,
    statement_name VARCHAR2(100) NOT NULL,
    filing_name VARCHAR2(150) NOT NULL,
    filing_date DATE,
    reporting_unit VARCHAR2(100),
    source_section VARCHAR2(150),
    date_collected DATE,
    verified CHAR(1),
    notes VARCHAR2(1000),
    CONSTRAINT fk_ds_period FOREIGN KEY (period_id) REFERENCES fiscal_periods(period_id),
    CONSTRAINT chk_ds_verified CHECK (verified IN ('Y','N'))
);
