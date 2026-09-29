SELECT payment_method, SUM(total_spent) AS receita, COUNT(transaction_id) AS quantidade_transacoes
FROM public.vendas
GROUP BY payment_method
ORDER BY receita DESC;

SELECT location, SUM(total_spent) AS receita, COUNT(transaction_id) AS quantidade_transacoes
FROM public.vendas
GROUP BY location
ORDER BY receita DESC;

SELECT item, SUM(total_spent) AS receita, COUNT(transaction_id) AS quantidade_transacoes, SUM(quantity) AS unidades_vendidas
FROM public.vendas
GROUP BY item
ORDER BY receita DESC;