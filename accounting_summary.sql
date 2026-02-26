CREATE OR REPLACE VIEW accounting_summary AS
SELECT
    (SELECT IFNULL(SUM(reserves.amount_yen),0) FROM reserves) AS total_reserve,
    (SELECT IFNULL(SUM(tokens.amount),0) FROM tokens WHERE tokens.status = 'active') AS issued_active,
    (SELECT IFNULL(SUM(tokens.amount),0) FROM tokens WHERE tokens.status = 'expired') AS expired_total,
    (SELECT IFNULL(SUM(reserves.amount_yen),0) FROM reserves)
    - (SELECT IFNULL(SUM(tokens.amount),0) FROM tokens WHERE tokens.status = 'active')
    AS calculated_balance;	

