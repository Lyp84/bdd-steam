insert into usuarios (id_usuario, nome_usuario, email, senha, data_nascimento, pais, data_criacao, avatar_url, steam_level, saldo_carteira)
VALUES (1, 'joaosilva', 'joao.silva@example.com', 'senha123', '1990-05-15', 'Brasil', CURRENT_TIMESTAMP, 'https://example.com/avatar/joao.png', 3, 150.75), 
(2, 'mariaoliveira', 'maria.oliveira@example.com', 'senha456', '1988-11-20', 'Portugal', CURRENT_TIMESTAMP, 'https://example.com/avatar/maria.png', 5, 320.00), 
(3, 'carlossantos', 'carlos.santos@example.com', 'senha789', '1995-03-10', 'Brasil', CURRENT_TIMESTAMP, 'https://example.com/avatar/carlos.png', 2, 50.00), 
(4, 'anapereira', 'ana.pereira@example.com', 'senha321', '1992-07-25', 'Espanha', CURRENT_TIMESTAMP, 'https://example.com/avatar/ana.png', 4, 210.40), 
(5, 'pedrogomes', 'pedro.gomes@example.com', 'senha654', '1985-01-05', 'Brasil', CURRENT_TIMESTAMP, 'https://example.com/avatar/pedro.png', 6, 500.00), 
(6, 'lucasferreira', 'lucas.ferreira@example.com', 'senha987', '1998-09-18', 'Argentina', CURRENT_TIMESTAMP, 'https://example.com/avatar/lucas.png', 1, 0.00), 
(7, 'beatrizsouza', 'beatriz.souza@example.com', 'senhaabc', '1993-12-30', 'Brasil', CURRENT_TIMESTAMP, 'https://example.com/avatar/beatriz.png', 2, 75.25), 
(8, 'ricardomendes', 'ricardo.mendes@example.com', 'senhaxyz', '1987-04-12', 'Chile', CURRENT_TIMESTAMP, 'https://example.com/avatar/ricardo.png', 7, 1000.00), 
(9, 'fernandocosta', 'fernando.costa@example.com', 'senha111', '1991-06-08', 'Brasil', CURRENT_TIMESTAMP, 'https://example.com/avatar/fernando.png', 3, 180.90), 
(10, 'julianaribeiro', 'juliana.ribeiro@example.com', 'senha222', '1996-02-22', 'México', CURRENT_TIMESTAMP, 'https://example.com/avatar/juliana.png', 1, 20.00);

insert into jogos (id_jogo, titulo, descricao, desenvolvedora, publicadora, data_lancamento, classificacao_etaria, requisitos_sistema, video_url, pagina_principal_url, preco_base, desconto_percentual, avaliacao_media, total_avaliacoes, data_cadastro)
VALUES (1, 'Dragon Slayer', 'RPG medieval com batalhas contra dragões.', 'MythicSoft', 'EpicPlay', '2020-03-15', '16', 'Windows 10, 8GB RAM, GTX 1050', 'https://example.com/videos/dragonslayer.mp4', 'https://example.com/dragonslayer', 199.90, 20, 4.5, 1200, CURRENT_TIMESTAMP), 
(2, 'Neon City', 'Ação futurista em uma metrópole cyberpunk.', 'NeonWorks', 'FutureGames', '2021-07-22', '18', 'Windows 10, 16GB RAM, RTX 2060', 'https://example.com/videos/neoncity.mp4', 'https://example.com/neoncity', 249.90, 15, 4.2, 850, CURRENT_TIMESTAMP), 
(3, 'Mystic Forest', 'Exploração e mistérios em uma floresta mágica.', 'AuroraSoft', 'IndieWorld', '2019-11-10', '12', 'Windows 7+, 4GB RAM, Intel HD', 'https://example.com/videos/mysticforest.mp4', 'https://example.com/mysticforest', 99.90, 10, 4.7, 430, CURRENT_TIMESTAMP), 
(4, 'Star Conqueror', 'Estratégia espacial com batalhas intergalácticas.', 'StarForge', 'UniversalPlay', '2022-05-05', '12', 'Windows 10, 8GB RAM, GTX 1050', 'https://example.com/videos/starconqueror.mp4', 'https://example.com/starconqueror', 179.90, 25, 4.0, 600, CURRENT_TIMESTAMP), 
(5, 'Haunted Mansion', 'Terror psicológico em uma mansão assombrada.', 'DarkMoon', 'HorrorGames', '2020-10-31', '18', 'Windows 10, 8GB RAM, GTX 970', 'https://example.com/videos/hauntedmansion.mp4', 'https://example.com/hauntedmansion', 149.90, 30, 3.8, 720, CURRENT_TIMESTAMP), 
(6, 'Speed Racers', 'Corridas de alta velocidade com carros lendários.', 'SpeedWorks', 'TurboPlay', '2018-06-15', '10', 'Windows 7+, 4GB RAM, GTX 750', 'https://example.com/videos/speedracers.mp4', 'https://example.com/speedracers', 129.90, 20, 4.3, 950, CURRENT_TIMESTAMP), 
(7, 'Castle Builders', 'Simulação de construção de reinos medievais.', 'CastleSoft', 'StrategyWorld', '2021-02-05', '10', 'Windows 10, 6GB RAM, GTX 960', 'https://example.com/videos/castlebuilders.mp4', 'https://example.com/castlebuilders', 119.90, 15, 4.6, 500, CURRENT_TIMESTAMP), 
(8, 'Zombie Apocalypse', 'Sobrevivência em mundo pós-apocalíptico cheio de zumbis.', 'Apocalypse Studios', 'SurvivorGames', '2019-11-11', '18', 'Windows 10, 8GB RAM, GTX 1050Ti', 'https://example.com/videos/zombieapocalypse.mp4', 'https://example.com/zombieapocalypse', 139.90, 40, 3.9, 1100, CURRENT_TIMESTAMP), 
(9, 'Deep Ocean', 'Exploração submarina com mistérios e criaturas marinhas.', 'BlueWave', 'NaturePlay', '2022-04-01', 'L', 'Windows 10, 4GB RAM, Intel HD', 'https://example.com/videos/deepocean.mp4', 'https://example.com/deepocean', 89.90, 10, 4.8, 300, CURRENT_TIMESTAMP), 
(10, 'Arena Heroes', 'MOBA competitivo com heróis únicos.', 'ArenaWorks', 'eSportsWorld', '2020-08-20', '12', 'Windows 10, 8GB RAM, GTX 1060', 'https://example.com/videos/arenaheroes.mp4', 'https://example.com/arenaheroes', 159.90, 25, 4.1, 2000, CURRENT_TIMESTAMP);

insert into biblioteca (id_biblioteca, id_usuario, id_jogo, data_aquisicao, horas_jogadas, ultimo_acesso)
VALUES (1, 1, 3, '2021-05-12', 120, '2025-12-20'), 
(2, 2, 5, '2020-11-03', 45, '2025-12-18'), 
(3, 3, 1, '2022-01-15', 200, '2025-12-22'), 
(4, 4, 7, '2019-07-25', 310, '2025-12-19'), 
(5, 5, 2, '2023-03-10', 80, '2025-12-21'), 
(6, 6, 9, '2021-09-18', 15, '2025-12-17'), 
(7, 7, 4, '2022-12-30', 60, '2025-12-20'), 
(8, 8, 6, '2020-04-12', 500, '2025-12-23'), 
(9, 9, 8, '2023-06-08', 95, '2025-12-19'), 
(10, 10, 10, '2021-02-22', 130, '2025-12-18');

insert into lista_desejos (id_lista, fk_usuario, fk_jogo, data_adicao)
VALUES (1, 1, 2, '2025-01-10'), 
(2, 2, 4, '2025-01-11'), 
(3, 3, 7, '2025-01-12'), 
(4, 4, 1, '2025-01-13'), 
(5, 5, 9, '2025-01-14'), 
(6, 6, 3, '2025-01-15'), 
(7, 7, 5, '2025-01-16'), 
(8, 8, 8, '2025-01-17'), 
(9, 9, 6, '2025-01-18'), 
(10, 10, 10, '2025-01-19');

insert into carrinho (id_item_carrinho, fk_usuario, fk_jogo, data_adicao)
VALUES (1, 1, 2, '2025-12-01'), 
(2, 2, 4, '2025-12-02'), 
(3, 3, 7, '2025-12-03'), 
(4, 4, 1, '2025-12-04'), 
(5, 5, 9, '2025-12-05'), 
(6, 6, 3, '2025-12-06'), 
(7, 7, 5, '2025-12-07'), 
(8, 8, 8, '2025-12-08'), 
(9, 9, 6, '2025-12-09'), 
(10, 10, 10, '2025-12-10');

insert into compras (id_compra, fk_usuario, data_compra, total, metodo_pagamento, endereco_ip, transacao_id)
VALUES (1, 1, '2025-12-01', 199.90, 'Cartão de Crédito', '192.168.0.10', 'TXN2001'), 
(2, 2, '2025-12-02', 89.90, 'Pix', '192.168.0.11', 'TXN2002'), 
(3, 3, '2025-12-03', 249.90, 'PayPal', '192.168.0.12', 'TXN2003'), 
(4, 4, '2025-12-04', 149.90, 'Cartão de Débito', '192.168.0.13', 'TXN2004'), 
(5, 5, '2025-12-05', 179.90, 'Boleto', '192.168.0.14', 'TXN2005'), 
(6, 6, '2025-12-06', 99.90, 'Cartão de Crédito', '192.168.0.15', 'TXN2006'), 
(7, 7, '2025-12-07', 129.90, 'Pix', '192.168.0.16', 'TXN2007'), 
(8, 8, '2025-12-08', 139.90, 'PayPal', '192.168.0.17', 'TXN2008'), 
(9, 9, '2025-12-09', 159.90, 'Cartão de Crédito', '192.168.0.18', 'TXN2009'), 
(10, 10, '2025-12-10', 189.90, 'Cartão de Débito', '192.168.0.19', 'TXN2010');

insert into itens_compra (id_item_compra, id_compra, id_jogo, preco_unitario, desconto_aplicado)
VALUES (1, 1, 2, 199.90, 20), 
(2, 1, 3, 99.90, 10), 
(3, 2, 5, 149.90, 30), 
(4, 2, 7, 119.90, 15), 
(5, 3, 1, 249.90, 15), 
(6, 4, 9, 139.90, 40), 
(7, 5, 4, 179.90, 25), 
(8, 6, 6, 129.90, 20), 
(9, 7, 8, 159.90, 25), 
(10, 8, 10, 189.90, 20);

insert into categorias (id_categoria, nome, descricao)
VALUES (1, 'RPG', 'Jogos de interpretação de personagens em mundos fictícios.'), 
(2, 'Ação', 'Jogos com foco em combate, reflexos e desafios rápidos.'), 
(3, 'Aventura', 'Jogos de exploração com narrativa envolvente e resolução de enigmas.'), 
(4, 'Estratégia', 'Jogos que exigem planejamento e tomada de decisões táticas.'), 
(5, 'Corrida', 'Jogos de velocidade com carros, motos ou outros veículos.'), 
(6, 'Esportes', 'Simulações de esportes reais como futebol, basquete ou tênis.'), 
(7, 'Terror', 'Jogos com atmosfera assustadora e foco em sobrevivência.'), 
(8, 'Simulação', 'Jogos que simulam atividades da vida real ou sistemas complexos.'), 
(9, 'Puzzle', 'Jogos de lógica e raciocínio para resolver desafios e quebra-cabeças.'), 
(10, 'Multiplayer Online', 'Jogos focados em interação entre múltiplos jogadores via internet.');

insert into avaliacoes (id_avaliacao, id_usuario, id_jogo, nota, comentario, data_avaliacao, util_count)
VALUES (1, 1, 2, 5, 'Excelente jogo, gráficos incríveis e jogabilidade fluida.', '2025-12-01', 12), 
(2, 2, 4, 4, 'Muito bom, mas poderia ter mais conteúdo.', '2025-12-02', 8), 
(3, 3, 7, 3, 'Diversão moderada, enredo um pouco fraco.', '2025-12-03', 5), 
(4, 4, 1, 5, 'Um dos melhores RPGs que já joguei!', '2025-12-04', 20), 
(5, 5, 9, 2, 'Não gostei, muitos bugs atrapalharam a experiência.', '2025-12-05', 3), 
(6, 6, 3, 4, 'Bom custo-benefício, recomendo para iniciantes.', '2025-12-06', 7), 
(7, 7, 5, 5, 'Atmosfera incrível, joguei por horas sem parar.', '2025-12-07', 15), 
(8, 8, 8, 3, 'Legal, mas repetitivo depois de um tempo.', '2025-12-08', 6), 
(9, 9, 6, 4, 'Ótimo jogo de corrida, trilha sonora empolgante.', '2025-12-09', 9), 
(10, 10, 10, 5, 'Perfeito para jogar com amigos, muito divertido!', '2025-12-10', 18);


insert into amizades (id_usuario1, id_usuario2, data_amizade)
VALUES (1, 2, '2025-01-10'), 
(1, 3, '2025-01-11'), 
(2, 4, '2025-01-12'), 
(3, 5, '2025-01-13'), 
(4, 6, '2025-01-14'), 
(5, 7, '2025-01-15'), 
(6, 8, '2025-01-16'), 
(7, 9, '2025-01-17'), 
(8, 10, '2025-01-18'), 
(9, 1, '2025-01-19');

insert into mensagens (id_mensagem, id_remetente, id_destinatario, conteudo, data_envio, lida)
VALUES (1, 1, 2, 'Oi, tudo bem?', '2025-12-01 10:15:00', true), 
(2, 2, 1, 'Tudo sim, e você?', '2025-12-01 10:17:00', true), 
(3, 3, 4, 'Vamos jogar mais tarde?', '2025-12-02 14:30:00', false), 
(4, 4, 3, 'Claro, estarei online às 20h.', '2025-12-02 14:35:00', true), 
(5, 5, 6, 'Gostei muito do novo jogo!', '2025-12-03 09:00:00', true), 
(6, 6, 5, 'Também achei incrível, jogabilidade ótima.', '2025-12-03 09:05:00', false), 
(7, 7, 8, 'Você viu a promoção da loja?', '2025-12-04 11:20:00', true), 
(8, 8, 7, 'Vi sim, estou pensando em comprar.', '2025-12-04 11:25:00', true), 
(9, 9, 10, 'Bom dia! Bora marcar uma partida.', '2025-12-05 08:45:00', false), 
(10, 10, 9, 'Bom dia! Hoje à noite pode ser?', '2025-12-05 08:50:00', true);

insert into dlcs (id_dlc, id_jogo_base, titulo, descricao, preco, data_lancamento)
VALUES (1, 1, 'Dragon Slayer: Cavernas Perdidas', 'Expansão com novas cavernas e chefes lendários.', 49.90, '2021-06-15'), 
(2, 2, 'Neon City: Pacote Neon Lights', 'Novas skins e missões em áreas futuristas.', 29.90, '2021-12-01'), 
(3, 3, 'Mystic Forest: Segredos Antigos', 'Conteúdo adicional com novas criaturas mágicas e puzzles.', 39.90, '2020-08-20'), 
(4, 4, 'Star Conqueror: Frota Galáctica', 'Expansão com novas naves e batalhas espaciais.', 59.90, '2022-11-05'), 
(5, 5, 'Haunted Mansion: Pesadelos Ocultos', 'Novos cenários de terror e inimigos assustadores.', 34.90, '2020-12-31'), 
(6, 6, 'Speed Racers: Super Circuitos', 'Pacote com pistas inéditas e carros exclusivos.', 19.90, '2019-07-10'), 
(7, 7, 'Castle Builders: Reinos Avançados', 'Novas construções e mecânicas de defesa.', 44.90, '2021-09-25'), 
(8, 8, 'Zombie Apocalypse: Sobrevivência Extrema', 'Modos de jogo hardcore e armas adicionais.', 39.90, '2020-05-14'), 
(9, 9, 'Deep Ocean: Mistérios Abissais', 'Expansão com criaturas marinhas raras e missões submarinas.', 29.90, '2022-06-01'), 
(10, 10, 'Arena Heroes: Campeões Lendários', 'Novos heróis jogáveis e arenas exclusivas.', 54.90, '2021-03-18');

insert into pacotes (id_pacote, nome, descricao, preco_total, desconto_pacote)
VALUES (1, 'Pacote RPG Épico', 'Inclui 3 jogos de RPG com expansões exclusivas.', 399.90, 20), 
(2, 'Pacote Ação Total', 'Coleção de jogos de ação e tiro em primeira pessoa.', 299.90, 15),
 (3, 'Pacote Aventura Fantástica', 'Jogos de exploração e narrativa envolvente.', 249.90, 10), 
 (4, 'Pacote Estratégia Suprema', 'Jogos de estratégia em tempo real e turnos.', 199.90, 25), 
 (5, 'Pacote Corrida Radical', 'Inclui os melhores jogos de corrida com pistas extras.', 179.90, 30), 
 (6, 'Pacote Esportes Campeões', 'Coleção de jogos de futebol, basquete e tênis.', 229.90, 20), 
 (7, 'Pacote Terror Sombrio', 'Jogos de terror psicológico e sobrevivência.', 159.90, 15), 
 (8, 'Pacote Simulação Realista', 'Simuladores de vida, cidades e veículos.', 269.90, 20), 
 (9, 'Pacote Puzzle Master', 'Jogos de lógica e quebra-cabeças desafiadores.', 99.90, 10), 
 (10, 'Pacote Multiplayer Online', 'Jogos focados em interação e competição online.', 349.90, 25);

 insert into pacote_itens (id_pacote, id_jogo)
 VALUES (1, 1), 
(1, 3), 
(2, 2), 
(2, 4), 
(3, 5), 
(3, 7), 
(4, 6),
(4, 8), 
(5, 9), 
(5, 10);