# SQL Retail Sales Analysis - P1

## 📌 Descrição
Este projeto contém consultas SQL para análise de vendas no varejo.  
O objetivo é explorar, limpar e analisar os dados da tabela `retail_sales`, respondendo a perguntas de negócio relevantes.

## 🛠️ Estrutura do Arquivo
O arquivo principal é **`sql_query_p1.sql`**, que contém:
1. **Criação da tabela** `retail_sales`.
2. **Limpeza dos dados** (remoção de registros nulos).
3. **Exploração inicial** (contagem de vendas, clientes e categorias).
4. **Consultas de análise de negócio**, como:
   - Vendas em datas específicas.
   - Transações filtradas por categoria e quantidade.
   - Total de vendas por categoria.
   - Idade média de clientes em determinadas categorias.
   - Identificação de grandes vendas (acima de 1000).
   - Transações por gênero e categoria.
   - Mês com melhor desempenho em vendas.
   - Top 5 clientes por volume de vendas.
   - Clientes únicos por categoria.
   - Volume de vendas por turno (manhã, tarde, noite).

## 📊 Exemplos de Consultas
- **Total de vendas por categoria**:
  ```sql
  SELECT 
      category,
      SUM(total_sale) AS net_sale,
      COUNT(*) AS total_orders
  FROM retail_sales
  GROUP BY 1;

- **Top 5 clientes com maior volume de vendas**:
```sql
  SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
  FROM retail_sales
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 5;
```
- **Turnos de vendas (manhã, tarde, noite)**:
  ```sql
  WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
  )
  SELECT 
    shift,
    COUNT(*) AS total_orders
  FROM hourly_sale
  GROUP BY shift;
  ```

## 🚀 Como usar:
1. Execute o script sql_query_p1.sql em seu banco de dados (PostgreSQL ou compatível).
2. Certifique-se de ter criado a tabela retail_sales com os dados adequados.
3. Rode as consultas para explorar os insights de vendas.

## 📈 Insights Possíveis:
- Identificação de categorias mais lucrativas.
- Perfil médio dos clientes por categoria.
- Distribuição das vendas ao longo do dia.
- Melhores meses de vendas por ano.
- Clientes mais valiosos para o negócio.

