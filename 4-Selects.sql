-- Active: 1768235672383@@127.0.0.1@5432@postgres@public
select titulo from jogos; 
select nome, descricao from categorias;
select nome_usuario as usuario, j.titulo as jogo, a.nota, a.comentario, a.data_avaliacao
from avaliacoes a
join jogos j on a.id_jogo = j.id_jogo
join usuarios u on a.id_usuario = u.id_usuario;

select titulo from jogos
where id_jogo in (
    select id_jogo from jogo_categorias
    where id_categoria = (
        select id_categoria from categorias
        where nome = 'Ação'
    )
);

select titulo from jogos
join jogo_categorias jc on jogos.id_jogo = jc.id_jogo;

select*from jogos; 

select u.nome_usuario,
j.titulo,
j.preco_final,
c.data_adicao
from carrinho c
join usuarios u on c.fk_usuario = u.id_usuario
join jogos j on c.fk_jogo = j.id_jogo;


SELECT u.nome_usuario, j.titulo, b.horas_jogadas, b.ultimo_acesso
FROM biblioteca b
JOIN usuarios u ON b.id_usuario = u.id_usuario
JOIN jogos j ON b.id_jogo = j.id_jogo;

SELECT c.id_compra, u.nome_usuario, j.titulo, i.preco_unitario, i.preco_pago FROM compras c JOIN usuarios u ON c.fk_usuario = u.id_usuario JOIN itens_compra i ON c.id_compra = i.id_compra JOIN jogos j ON i.id_jogo = j.id_jogo;


SELECT j.titulo, cat.nome AS categoria
FROM jogo_categorias jc
JOIN jogos j ON jc.id_jogo = j.id_jogo
JOIN categorias cat ON jc.id_categoria = cat.id_categoria;

SELECT u.nome_usuario, j.titulo, a.nota, a.comentario
FROM avaliacoes a
JOIN usuarios u ON a.id_usuario = u.id_usuario
JOIN jogos j ON a.id_jogo = j.id_jogo;

SELECT u1.nome_usuario AS usuario, u2.nome_usuario AS amigo, am.status
FROM amizades am
JOIN usuarios u1 ON am.id_usuario1 = u1.id_usuario
JOIN usuarios u2 ON am.id_usuario2 = u2.id_usuario;


SELECT j.titulo AS jogo_base, d.titulo AS dlc, d.preco
FROM dlcs d
JOIN jogos j ON d.id_jogo_base = j.id_jogo;


SELECT p.nome AS pacote, j.titulo AS jogo, p.preco_total, p.desconto_pacote
FROM pacote_itens pi
JOIN pacotes p ON pi.id_pacote = p.id_pacote
JOIN jogos j ON pi.id_jogo = j.id_jogo;

SELECT u.nome_usuario, j.titulo, ld.data_adicao
FROM lista_desejos ld
JOIN usuarios u ON ld.fk_usuario = u.id_usuario
JOIN jogos j ON ld.fk_jogo = j.id_jogo;

SELECT r.nome_usuario AS remetente, d.nome_usuario AS destinatario, m.conteudo, m.data_envio
FROM mensagens m
JOIN usuarios r ON m.id_remetente = r.id_usuario
JOIN usuarios d ON m.id_destinatario = d.id_usuario;


SELECT j.titulo, round(AVG(a.nota),2) AS media_notas, COUNT(a.id_avaliacao) AS total_avaliacoes
FROM jogos j
JOIN avaliacoes a ON j.id_jogo = a.id_jogo
GROUP BY j.titulo;

SELECT u.nome_usuario, c.id_compra, c.data_compra, c.total, c.status
FROM compras c
JOIN usuarios u ON c.fk_usuario = u.id_usuario;

SELECT j.titulo AS jogo_base, d.titulo AS dlc, cat.nome AS categoria
FROM dlcs d
JOIN jogos j ON d.id_jogo_base = j.id_jogo
JOIN jogo_categorias jc ON j.id_jogo = jc.id_jogo
JOIN categorias cat ON jc.id_categoria = cat.id_categoria;

SELECT p.nome AS pacote, j.titulo AS jogo, p.preco_total, p.desconto_pacote
FROM pacotes p
JOIN pacote_itens pi ON p.id_pacote = pi.id_pacote
JOIN jogos j ON pi.id_jogo = j.id_jogo;


SELECT u1.nome_usuario AS usuario, u2.nome_usuario AS amigo, am.status, m.conteudo
FROM amizades am
JOIN usuarios u1 ON am.id_usuario1 = u1.id_usuario
JOIN usuarios u2 ON am.id_usuario2 = u2.id_usuario
LEFT JOIN mensagens m ON (m.id_remetente = u1.id_usuario AND m.id_destinatario = u2.id_usuario);


SELECT j.titulo, SUM(i.preco_pago) AS receita_total
FROM itens_compra i
JOIN jogos j ON i.id_jogo = j.id_jogo
GROUP BY j.titulo
ORDER BY receita_total DESC;
SELECT u.nome_usuario, u.saldo_carteira, j.titulo, j.preco_final
FROM carrinho c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
JOIN jogos j ON c.fk_jogo = j.id_jogo
ORDER BY u.saldo_carteira DESC;

SELECT u.nome_usuario, SUM(b.horas_jogadas) AS total_horas
FROM biblioteca b
JOIN usuarios u ON b.id_usuario = u.id_usuario
GROUP BY u.nome_usuario
ORDER BY total_horas DESC
LIMIT 5;

SELECT j.titulo, COUNT(ld.fk_usuario) AS total_desejos
FROM lista_desejos ld
JOIN jogos j ON ld.fk_jogo = j.id_jogo
GROUP BY j.titulo
ORDER BY total_desejos DESC;

SELECT cat.nome AS categoria, SUM(ic.preco_pago) AS receita_total
FROM itens_compra ic
JOIN jogos j ON ic.id_jogo = j.id_jogo
JOIN jogo_categorias jc ON j.id_jogo = jc.id_jogo
JOIN categorias cat ON jc.id_categoria = cat.id_categoria
GROUP BY cat.nome
ORDER BY receita_total DESC;

SELECT u1.nome_usuario AS usuario, u2.nome_usuario AS amigo, am.status
FROM amizades am
JOIN usuarios u1 ON am.id_usuario1 = u1.id_usuario
JOIN usuarios u2 ON am.id_usuario2 = u2.id_usuario
WHERE am.status = 'aceito';

SELECT j.titulo, AVG(a.nota) AS media
FROM avaliacoes a
JOIN jogos j ON a.id_jogo = j.id_jogo
GROUP BY j.titulo
HAVING AVG(a.nota) >= 4
ORDER BY media DESC;

SELECT u.pais, SUM(c.total) AS gasto_total
FROM compras c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
GROUP BY u.pais
ORDER BY gasto_total DESC;

SELECT j.titulo AS jogo_base, d.titulo AS dlc, AVG(a.nota) AS media_avaliacao
FROM dlcs d
JOIN jogos j ON d.id_jogo_base = j.id_jogo
LEFT JOIN avaliacoes a ON j.id_jogo = a.id_jogo
GROUP BY j.titulo, d.titulo;

SELECT u.nome_usuario, j.titulo, i.preco_pago, c.data_compra
FROM compras c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
JOIN itens_compra i ON c.id_compra = i.id_compra
JOIN jogos j ON i.id_jogo = j.id_jogo
ORDER BY c.data_compra DESC;

SELECT j.titulo, COUNT(b.id_usuario) AS total_usuarios
FROM biblioteca b
JOIN jogos j ON b.id_jogo = j.id_jogo
GROUP BY j.titulo
ORDER BY total_usuarios DESC;

SELECT u.nome_usuario, COUNT(*) AS total_amigos
FROM amizades a
JOIN usuarios u ON a.id_usuario1 = u.id_usuario
WHERE a.status = 'aceito'
GROUP BY u.nome_usuario
ORDER BY total_amigos DESC;

SELECT titulo, preco_base, desconto_percentual, preco_final
FROM jogos
WHERE desconto_percentual > 0
ORDER BY desconto_percentual DESC;

SELECT cat.nome AS categoria, COUNT(a.id_avaliacao) AS total_avaliacoes
FROM avaliacoes a
JOIN jogos j ON a.id_jogo = j.id_jogo
JOIN jogo_categorias jc ON j.id_jogo = jc.id_jogo
JOIN categorias cat ON jc.id_categoria = cat.id_categoria
GROUP BY cat.nome
ORDER BY total_avaliacoes DESC;

SELECT u.nome_usuario, SUM(c.total) AS gasto_total
FROM compras c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
GROUP BY u.nome_usuario
ORDER BY gasto_total DESC;

SELECT j.titulo AS jogo_base, d.titulo AS dlc, p.nome AS pacote
FROM jogos j
LEFT JOIN dlcs d ON j.id_jogo = d.id_jogo_base
LEFT JOIN pacote_itens pi ON j.id_jogo = pi.id_jogo
LEFT JOIN pacotes p ON pi.id_pacote = p.id_pacote;

SELECT u.nome_usuario AS remetente, m.conteudo, m.data_envio
FROM mensagens m
JOIN usuarios u ON m.id_remetente = u.id_usuario
WHERE m.lida = false;

SELECT u.nome_usuario, j.titulo, j.preco_final
FROM carrinho c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
JOIN jogos j ON c.fk_jogo = j.id_jogo
ORDER BY j.preco_final DESC;

SELECT u.nome_usuario, j.titulo, i.preco_unitario, i.desconto_aplicado, i.preco_pago
FROM itens_compra i
JOIN compras c ON i.id_compra = c.id_compra
JOIN usuarios u ON c.fk_usuario = u.id_usuario
JOIN jogos j ON i.id_jogo = j.id_jogo
WHERE i.desconto_aplicado > 0;

SELECT j.titulo, COUNT(a.id_avaliacao) AS total_avaliacoes
FROM avaliacoes a
JOIN jogos j ON a.id_jogo = j.id_jogo
GROUP BY j.titulo
ORDER BY total_avaliacoes DESC;

SELECT cat.nome AS categoria, COUNT(j.id_jogo) AS total_jogos
FROM jogo_categorias jc
JOIN categorias cat ON jc.id_categoria = cat.id_categoria
JOIN jogos j ON jc.id_jogo = j.id_jogo
WHERE j.status = 'ativo'
GROUP BY cat.nome
ORDER BY total_jogos DESC;

SELECT u.nome_usuario, j.titulo, a.nota, a.comentario
FROM avaliacoes a
JOIN usuarios u ON a.id_usuario = u.id_usuario
JOIN jogos j ON a.id_jogo = j.id_jogo;

SELECT u.nome_usuario, SUM(d.preco) AS gasto_dlcs
FROM biblioteca b
JOIN usuarios u ON b.id_usuario = u.id_usuario
JOIN dlcs d ON b.id_jogo = d.id_jogo_base
GROUP BY u.nome_usuario
ORDER BY gasto_dlcs DESC;

SELECT p.nome AS pacote, COUNT(pi.id_jogo) AS total_jogos
FROM pacotes p
JOIN pacote_itens pi ON p.id_pacote = pi.id_pacote
GROUP BY p.nome
ORDER BY total_jogos DESC;

SELECT u.nome_usuario, COUNT(m.id_mensagem) AS mensagens_enviadas
FROM mensagens m
JOIN usuarios u ON m.id_remetente = u.id_usuario
GROUP BY u.nome_usuario
ORDER BY mensagens_enviadas DESC;

SELECT j.titulo, SUM(b.horas_jogadas) AS horas_totais
FROM biblioteca b
JOIN jogos j ON b.id_jogo = j.id_jogo
GROUP BY j.titulo
ORDER BY horas_totais DESC;

SELECT 
    u.nome_usuario,
    c.id_compra,
    c.data_compra,
    j.titulo AS jogo,
    cat.nome AS categoria,
    i.preco_unitario,
    i.desconto_aplicado,
    i.preco_pago
FROM compras c
JOIN usuarios u ON c.fk_usuario = u.id_usuario
JOIN itens_compra i ON c.id_compra = i.id_compra
JOIN jogos j ON i.id_jogo = j.id_jogo
LEFT JOIN jogo_categorias jc ON j.id_jogo = jc.id_jogo
LEFT JOIN categorias cat ON jc.id_categoria = cat.id_categoria
ORDER BY c.data_compra DESC;

SELECT 
    u.pais,
    j.titulo,
    SUM(b.horas_jogadas) AS horas_totais
FROM biblioteca b
JOIN usuarios u ON b.id_usuario = u.id_usuario
JOIN jogos j ON b.id_jogo = j.id_jogo
GROUP BY u.pais, j.titulo
ORDER BY horas_totais DESC;

SELECT 
    cat.nome AS categoria,
    SUM(ic.preco_pago) AS receita_total,
    COUNT(DISTINCT j.id_jogo) AS jogos_vendidos,
    COUNT(DISTINCT c.fk_usuario) AS usuarios_compradores
FROM itens_compra ic
JOIN jogos j ON ic.id_jogo = j.id_jogo
JOIN jogo_categorias jc ON j.id_jogo = jc.id_jogo
JOIN categorias cat ON jc.id_categoria = cat.id_categoria
JOIN compras c ON ic.id_compra = c.id_compra
GROUP BY cat.nome
ORDER BY receita_total DESC;

SELECT 
    u.nome_usuario,
    COUNT(DISTINCT a.id_usuario2) AS total_amigos,
    COUNT(DISTINCT m.id_mensagem) AS mensagens_enviadas,
    COUNT(DISTINCT c.id_compra) AS total_compras
FROM usuarios u
LEFT JOIN amizades a ON u.id_usuario = a.id_usuario1 AND a.status = 'aceito'
LEFT JOIN mensagens m ON u.id_usuario = m.id_remetente
LEFT JOIN compras c ON u.id_usuario = c.fk_usuario
GROUP BY u.nome_usuario
ORDER BY total_compras DESC, total_amigos DESC, mensagens_enviadas DESC;

SELECT 
    j.titulo,
    COUNT(DISTINCT ic.id_compra) AS total_vendas,
    AVG(a.nota) AS media_avaliacao,
    SUM(b.horas_jogadas) AS horas_totais
FROM jogos j
LEFT JOIN itens_compra ic ON j.id_jogo = ic.id_jogo
LEFT JOIN avaliacoes a ON j.id_jogo = a.id_jogo
LEFT JOIN biblioteca b ON j.id_jogo = b.id_jogo
GROUP BY j.titulo
ORDER BY total_vendas DESC, media_avaliacao DESC, horas_totais DESC;

select titulo, avaliacao_media from jogos
where avaliacao_media >= 4.5