-- Write your query below
with apples AS (
SELECT sale_date, SUM(sold_num) AS n_apples
FROM sales
WHERE fruit = 'apples'
GROUP BY sale_date
), oranges AS (
SELECT sale_date, SUM(sold_num) AS n_oranges
FROM sales
WHERE fruit = 'oranges'
GROUP BY sale_date
)
SELECT a.sale_date, a.n_apples - o.n_oranges AS diff
FROM apples a 
JOIN oranges o ON o.sale_date = a.sale_date

