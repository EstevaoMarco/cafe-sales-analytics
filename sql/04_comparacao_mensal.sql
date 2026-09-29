SELECT
    DATE_TRUNC('month', transaction_date) AS mes,
    item,
    SUM(quantity) AS quantidade_vendida,
    SUM(total_spent) AS receita,
    ROUND(AVG(total_spent), 2) AS ticket_medio,
	ROUND(AVG(quantity), 2) AS media_unidades_por_transacao,
	COUNT(transaction_id) AS quantidade_transacoes,
	COUNT(total_spent) AS transacoes_com_receita
FROM public.vendas
WHERE DATE_TRUNC('month', transaction_date) IN (
    DATE '2023-06-01',
    DATE '2023-10-01'
)
GROUP BY mes, item
ORDER BY mes, item;
