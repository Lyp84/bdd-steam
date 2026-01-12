-- TABELAS PRINCIPAIS

--usuarios
create table usuarios (
    id_usuario serial primary key,
    nome_usuario varchar(50) unique not null,
    email varchar(255) unique not null,
    senha varchar(255) not null,
    data_nascimento date,
    pais varchar(50),
    data_criacao timestamp default current_timestamp,
    avatar_url text,
    steam_level integer default 1,
    saldo_carteira decimal(10,2) default 0.00,
    check (steam_level >= 1)
);

--jogos
create table jogos (
    id_jogo serial primary key,
    titulo varchar(255) not null,
    descricao text,
    desenvolvedora varchar(100),
    publicadora varchar(100),
    data_lancamento date,
    classificacao_etaria varchar(10),
    requisitos_sistema text,
    video_url text,
    pagina_principal_url text,
    preco_base decimal(10,2) not null,
    desconto_percentual integer default 0,
    preco_final decimal(10,2) generated always as (preco_base * (1 - desconto_percentual::decimal/100)) stored,
    avaliacao_media decimal(3,2),
    total_avaliacoes integer default 0,
    data_cadastro timestamp default current_timestamp,
    esta_ativo boolean default true
);

-- RELAÇÃO USUARIO-JOGO


--biblioteca
create table biblioteca (
    id_biblioteca serial primary key,
    id_usuario integer not null references usuarios(id_usuario) on delete cascade,
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    data_aquisicao timestamp default current_timestamp,
    horas_jogadas decimal(10,2) default 0,
    ultimo_acesso timestamp,
    unique(id_usuario, id_jogo)
);

--lista_desejos
create table lista_desejos (
    id_lista serial primary key,
    id_usuario integer not null references usuarios(id_usuario) on delete cascade,
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    data_adicao timestamp default current_timestamp,
    unique(id_usuario, id_jogo)
);

--carrinho
create table carrinho (
    id_item_carrinho serial primary key,
    id_usuario integer not null references usuarios(id_usuario) on delete cascade,
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    data_adicao timestamp default current_timestamp,
    unique(id_usuario, id_jogo)
);

-- SISTEMA DE COMPRAS

--compras
create table compras (
    id_compra serial primary key,
    id_usuario integer not null references usuarios(id_usuario) on delete cascade,
    data_compra timestamp default current_timestamp,
    total decimal(10,2) not null,
    metodo_pagamento varchar(50),
    status varchar(20) default 'pendente',
    endereco_ip varchar(45),
    transacao_id varchar(100)
);

--itens_compra
create table itens_compra (
    id_item_compra serial primary key,
    id_compra integer not null references compras(id_compra) on delete cascade,
    id_jogo integer not null references jogos(id_jogo),
    preco_unitario decimal(10,2) not null,
    desconto_aplicado decimal(5,2) default 0,
    preco_pago decimal(10,2) generated always as (preco_unitario * (1 - desconto_aplicado/100)) stored,
    unique(id_compra, id_jogo)
);

-- CATEGORIAS E AVALIAÇÕES

--categorias
create table categorias (
    id_categoria serial primary key,
    nome varchar(50) unique not null,
    descricao text
);

--jogo_categorias
create table jogo_categorias (
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    id_categoria integer not null references categorias(id_categoria) on delete cascade,
    primary key (id_jogo, id_categoria)
);

--avaliacoes
create table avaliacoes (
    id_avaliacao serial primary key,
    id_usuario integer not null references usuarios(id_usuario) on delete cascade,
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    nota integer not null check (nota >= 1 and nota <= 5),
    comentario text,
    data_avaliacao timestamp default current_timestamp,
    util_count integer default 0,
    nao_util_count integer default 0,
    unique(id_usuario, id_jogo)
);

-- COMUNIDADE E AMIGOS


--amizades
create table amizades (
    id_usuario1 integer not null references usuarios(id_usuario) on delete cascade,
    id_usuario2 integer not null references usuarios(id_usuario) on delete cascade,
    data_amizade timestamp default current_timestamp,
    status varchar(20) default 'pendente',
    check (id_usuario1 < id_usuario2),
    primary key (id_usuario1, id_usuario2)
);

--mensagens
create table mensagens (
    id_mensagem serial primary key,
    id_remetente integer not null references usuarios(id_usuario) on delete cascade,
    id_destinatario integer not null references usuarios(id_usuario) on delete cascade,
    conteudo text not null,
    data_envio timestamp default current_timestamp,
    lida boolean default false
);


-- CONTEÚDO ADICIONAL


--dlcs
create table dlcs (
    id_dlc serial primary key,
    id_jogo_base integer not null references jogos(id_jogo) on delete cascade,
    titulo varchar(255) not null,
    descricao text,
    preco decimal(10,2) not null,
    data_lancamento date
);

--pacotes
create table pacotes (
    id_pacote serial primary key,
    nome varchar(255) not null,
    descricao text,
    preco_total decimal(10,2) not null,
    desconto_pacote integer default 0
);

--pacote_itens
create table pacote_itens (
    id_pacote integer not null references pacotes(id_pacote) on delete cascade,
    id_jogo integer not null references jogos(id_jogo) on delete cascade,
    primary key (id_pacote, id_jogo)
);