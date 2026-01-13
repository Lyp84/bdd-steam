
INSERT INTO biblioteca (id_biblioteca, fk_usuario, fk_jogo, data_aquisicao, horas_jogadas, ultimo_acesso)
VALUES 
(1, 1, 3, '2021-05-12', 120, '2025-12-20'), 
(2, 2, 5, '2020-11-03', 45, '2025-12-18'), 
(3, 3, 1, '2022-01-15', 200, '2025-12-22'), 
(4, 4, 7, '2019-07-25', 310, '2025-12-19'), 
(5, 5, 2, '2023-03-10', 80, '2025-12-21'), 
(6, 6, 9, '2021-09-18', 15, '2025-12-17'), 
(7, 7, 4, '2022-12-30', 60, '2025-12-20'), 
(8, 8, 6, '2020-04-12', 500, '2025-12-23'), 
(9, 9, 8, '2023-06-08', 95, '2025-12-19'), 
(10, 10, 10, '2021-02-22', 130, '2025-12-18');


INSERT INTO itens_compra (id_item_compra, fk_compra, fk_jogo, preco_unitario, desconto_aplicado)
VALUES 
(1, 1, 2, 199.90, 20), 
(2, 1, 3, 99.90, 10), 
(3, 2, 5, 149.90, 30), 
(4, 2, 7, 119.90, 15), 
(5, 3, 1, 249.90, 15), 
(6, 4, 9, 139.90, 40), 
(7, 5, 4, 179.90, 25), 
(8, 6, 6, 129.90, 20), 
(9, 7, 8, 159.90, 25), 
(10, 8, 10, 189.90, 20);


INSERT INTO avaliacoes (id_avaliacao, fk_usuario, fk_jogo, nota, comentario, data_avaliacao, util_count)
VALUES 
(1, 1, 2, 5, 'Excelente jogo, gráficos incríveis e jogabilidade fluida.', '2025-12-01', 12), 
(2, 2, 4, 4, 'Muito bom, mas poderia ter mais conteúdo.', '2025-12-02', 8), 
(3, 3, 7, 3, 'Diversão moderada, enredo um pouco fraco.', '2025-12-03', 5), 
(4, 4, 1, 5, 'Um dos melhores RPGs que já joguei!', '2025-12-04', 20), 
(5, 5, 9, 2, 'Não gostei, muitos bugs atrapalharam a experiência.', '2025-12-05', 3), 
(6, 6, 3, 4, 'Bom custo-benefício, recomendo para iniciantes.', '2025-12-06', 7), 
(7, 7, 5, 5, 'Atmosfera incrível, joguei por horas sem parar.', '2025-12-07', 15), 
(8, 8, 8, 3, 'Legal, mas repetitivo depois de um tempo.', '2025-12-08', 6), 
(9, 9, 6, 4, 'Ótimo jogo de corrida, trilha sonora empolgante.', '2025-12-09', 9), 
(10, 10, 10, 5, 'Perfeito para jogar com amigos, muito divertido!', '2025-12-10', 18);

INSERT INTO pacote_itens (fk_pacote, fk_jogo)
VALUES 
(1, 1), 
(1, 3), 
(2, 2), 
(2, 4), 
(3, 5), 
(3, 7), 
(4, 6),
(4, 8), 
(5, 9), 
(5, 10);