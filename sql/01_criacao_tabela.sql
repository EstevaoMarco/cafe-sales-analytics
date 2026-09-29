CREATE TABLE public.vendas (
    transaction_id TEXT PRIMARY KEY,
    item TEXT NOT NULL,
    quantity INTEGER CHECK (quantity > 0),
    price_per_unit NUMERIC(10, 2) CHECK (price_per_unit > 0),
    total_spent NUMERIC(12, 2) CHECK (total_spent > 0),
    payment_method TEXT NOT NULL,
    location TEXT NOT NULL,
    transaction_date DATE
);
SELECT * FROM public.vendas LIMIT 5;