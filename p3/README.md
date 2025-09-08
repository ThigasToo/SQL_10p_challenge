# Análise de Dados da Netflix com SQL

## Visão Geral

Este projeto utiliza um conjunto de dados da Netflix para demonstrar a proficiência em SQL na resolução de problemas de negócios comuns. O script SQL fornecido (`sql_p3.sql`) contém consultas que exploram vários aspectos do catálogo da Netflix, como a distribuição de conteúdo, classificações, datas de lançamento e muito mais. Cada consulta é projetada para responder a uma pergunta de negócio específica, mostrando como o SQL pode ser usado para extrair insights acionáveis a partir de dados.

## O Conjunto de Dados

O esquema da tabela `netflix` é o seguinte:

| Coluna       | Tipo de Dados | Descrição                                             |
|--------------|---------------|---------------------------------------------------------|
| show_id      | VARCHAR(5)    | ID exclusivo para cada filme ou programa de TV.         |
| type         | VARCHAR(10)   | O tipo de conteúdo, "Movie" ou "TV Show".               |
| title        | VARCHAR(250)  | O título do filme ou programa de TV.                    |
| director     | VARCHAR(550)  | O(s) diretor(es) do conteúdo.                           |
| casts        | VARCHAR(1050) | Os principais atores/atrizes do conteúdo.               |
| country      | VARCHAR(550)  | O(s) país(es) onde o conteúdo foi produzido.            |
| date_added   | VARCHAR(55)   | A data em que o conteúdo foi adicionado à Netflix.      |
| release_year | INT           | O ano em que o conteúdo foi lançado originalmente.       |
| rating       | VARCHAR(15)   | A classificação de maturidade do conteúdo (por exemplo, TV-MA, PG-13). |
| duration     | VARCHAR(15)   | A duração do conteúdo (em minutos para filmes, em temporadas para programas de TV). |
| listed_in    | VARCHAR(250)  | As categorias de gênero do conteúdo.                    |
| description  | VARCHAR(550)  | Uma breve sinopse do conteúdo.                          |

## Problemas de Negócios e Soluções em SQL

O script aborda os 15 problemas de negócios a seguir com suas respectivas consultas SQL:

1.  **Contar o Número de Filmes vs. Programas de TV:** Calcula o número total de filmes e programas de TV disponíveis na Netflix.
2.  **Encontrar a Classificação Mais Comum:** Identifica a classificação de maturidade mais frequente para filmes e programas de TV.
3.  **Listar Conteúdo por Ano de Lançamento:** Retorna uma lista de todo o conteúdo lançado em um ano específico (por exemplo, 2020).
4.  **Top 5 Países por Quantidade de Conteúdo:** Determina os cinco principais países com o maior número de produções na Netflix.
5.  **Identificar o Filme Mais Longo:** Encontra o filme com a maior duração.
6.  **Encontrar Conteúdo Adicionado nos Últimos 5 Anos:** Lista todos os filmes e programas de TV adicionados à plataforma nos últimos cinco anos.
7.  **Encontrar Conteúdo por Diretor Específico:** Lista todos os trabalhos dirigidos por um diretor específico (por exemplo, Rajiv Chilaka).
8.  **Listar Programas de TV com Mais de 5 Temporadas:** Identifica programas de TV que têm mais de cinco temporadas.
9.  **Contar o Número de Itens de Conteúdo por Gênero:** Fornece uma contagem de conteúdo para cada gênero.
10. **Top 5 Anos com a Maior Média de Lançamentos de Conteúdo nos EUA:** Identifica os cinco anos com a maior média de lançamentos de conteúdo nos Estados Unidos.
11. **Listar Todos os Documentários:** Retorna uma lista de todos os conteúdos categorizados como documentários.
12. **Encontrar Conteúdo Sem Diretor:** Lista todos os filmes e programas de TV onde a informação do diretor está ausente.
13. **Contar Filmes de um Ator nos Últimos 10 Anos:** Encontra o número de filmes em que um ator específico (por exemplo, Luis Ernesto Franco) apareceu nos últimos dez anos.
14. **Top 10 Atores na África do Sul:** Identifica os dez principais atores que apareceram no maior número de filmes produzidos na África do Sul.
15. **Categorizar Conteúdo por Palavras-Chave na Descrição:** Categoriza o conteúdo como "Bom" ou "Ruim" com base na presença das palavras-chave "kill" e "violence" na descrição e conta o número de itens em cada categoria.

## Como Usar

1.  **Criação da Tabela:** Execute a instrução `CREATE TABLE netflix` para criar a tabela em seu banco de dados.
2.  **Importação de dados:** Acesse o repositório com os dados [aqui](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)
3.  **Importação de Dados:** Popule a tabela `netflix` com os dados de um arquivo CSV da Netflix. A primeira linha do script (`DROP TABLE IF EXISTS netflix;`) garante que você comece com uma tabela limpa a cada vez.
4.  **Execução das Consultas:** Execute as consultas individuais para obter insights sobre o conjunto de dados.
