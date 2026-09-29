-- Comparar a base carregada com os controles do notebook.
SELECT
    COUNT(*) AS total_transacoes,
    COUNT(DISTINCT transaction_id) AS ids_distintos,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS sem_quantidade,
    COUNT(*) FILTER (WHERE price_per_unit IS NULL) AS sem_preco,
    COUNT(*) FILTER (WHERE total_spent IS NULL) AS sem_total,
    COUNT(*) FILTER (WHERE transaction_date IS NULL) AS sem_data,
    COUNT(*) FILTER (
        WHERE quantity IS NULL OR price_per_unit IS NULL OR total_spent IS NULL
    ) AS numericamente_incompletas
FROM public.vendas;
-- Esperado: 10000, 10000, 23, 6, 23, 460, 26.

SELECT
    SUM(quantity) AS unidades_vendidas,
    SUM(total_spent) AS receita_conhecida,
    COUNT(total_spent) AS transacoes_com_receita,
    ROUND(AVG(total_spent), 2) AS ticket_medio
FROM public.vendas;
-- Esperado: 30180, 89096.00, 9977, 8.93.

SELECT COUNT(*) AS totais_divergentes
FROM public.vendas
WHERE quantity IS NOT NULL AND price_per_unit IS NOT NULL AND total_spent IS NOT NULL
  AND ABS(quantity * price_per_unit - total_spent) > 0.01;
-- Esperado: 0.
