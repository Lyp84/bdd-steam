
-- GERENCIAR BIBLIOTECA
create or replace function fc_add_delete_jogo_biblioteca()
returns trigger as $$
begin
    -- APROVADO
    if (new.status = 'aprovado' and old.status != 'aprovado') then
        insert into biblioteca (fk_usuario, fk_jogo, data_aquisicao)
        select 
            new.fk_usuario,
            ic.id_jogo,
            new.data_compra
        from itens_compra ic
        where ic.id_compra = new.id_compra;
    
    -- CANCELADO
    elsif (new.status = 'cancelado' and old.status = 'aprovado') then
        delete from biblioteca b
        where b.fk_usuario = new.fk_usuario
        and b.fk_jogo in (
            select id_jogo 
            from itens_compra 
            where id_compra = new.id_compra
        );
    
    -- REEMBOLSO
    elsif (new.status = 'reembolsado' and old.status = 'aprovado') then
        delete from biblioteca b
        where b.fk_usuario = new.fk_usuario
        and b.fk_jogo in (
            select id_jogo 
            from itens_compra 
            where id_compra = new.id_compra
        );
    end if;
    
    return new;
end;
$$ language plpgsql;


-- TRIGGER BILIOTECA

create or replace trigger tgr_update_biblioteca_por_compra
after update of status on compras 
for each row 
execute function fc_add_delete_jogo_biblioteca();

-- REMOVER DA LISTA DE DESEJOS

create or replace function fc_delete_jogo_lista_desejos()
returns trigger as $$
begin
    if (new.status = 'aprovado') then
        delete from lista_desejos
        where fk_usuario = new.fk_usuario
        and fk_jogo in (
            select fk_jogo
            from itens_compra
            where fk_compra = new.id_compra
        );
    end if;
    
    return new;
end;
$$ language plpgsql;

-- TRIGGER LISTA DE DESEJOS_COMPRAS
create or replace trigger tgr_remover_lista_desejos
after update of status on compras 
for each row 
execute function fc_delete_jogo_lista_desejos();


--ADICIONAR AMIZADE

create or replace function fc_gerenciar_amizades()
returns trigger as $$
begin
    if (new.fk_usuario1 = new.fk_usuario2) then
        raise exception 'Não é possível adicionar a si mesmo como amigo';
    end if;
    
    if (tg_op = 'INSERT') then
        if exists (
            select 1 from amizades 
            where (fk_usuario1 = new.fk_usuario1 and fk_usuario2 = new.fk_usuario2)
               or (fk_usuario1 = new.fk_usuario2 and fk_usuario2 = new.fk_usuario1)
        ) then
            raise exception 'Já existe um pedido entre esses usuários';
        end if;
    
    elsif (tg_op = 'UPDATE' and new.status = 'aceito' and old.status != 'aceito') then
        update amizades 
        set status = 'aceito'
        where fk_usuario1 = new.fk_usuario2
          and fk_usuario2 = new.fk_usuario1;
    end if;
    
    return new;
end;
$$ language plpgsql;

--TRIGGER ADICIONAR AMIZADE 
create trigger tgr_gerenciar_amizades
before insert or update on amizades
for each row 
execute function fc_gerenciar_amizades();


--CLASSIFICAÇÃO JOGO
create function fc_validar_idade_jogo()
returns trigger as $$
    declare
        idade_usuario integer;
        classificacao_minima integer;
        classificacao_jogo varchar(10);
    begin
        --classificação jogo
        select j.classificacao_etaria into classificacao_jogo
        from jogos j
        where j.id_jogo = new.fk_jogo;

        --calculo idade
        select extract(year from age(current_date, u.data_nascimento )) into 
        idade_usuario from usuarios u 
        where u.id_usuario = new.fk_usuario;
        
        --transformação de dados
        case 
            when classificacao_jogo = 'L' then classificacao_minima := 0;
            when classificacao_jogo = '10' then classificacao_minima := 10;
            when classificacao_jogo = '12' then classificacao_minima := 12;
            when classificacao_jogo = '14' then classificacao_minima := 14;
            when classificacao_jogo = '16' then classificacao_minima := 16;
            when classificacao_jogo = '18' then classificacao_minima := 18;
        end case;

        --validação idade se nula
        if idade_usuario is null then
         return new;
        end if;

        --validação idade
        if idade_usuario < classificacao_minima then
        raise exception 'Usuário não tem idade mínima para este jogo. Idade: %, Requerido: %+',
        idade_usuario, classificacao_minima;
        end if;

        return new;
    end;
$$ language plpgsql;

--TRIGGER CLASSIFICAÇÃO JOGOS
create trigger tgr_validar_idade_carrinho
before insert on carrinho
for each row 
execute function fc_validar_idade_jogo();


--ATUALIZAÇÃO DE SALDO 
create function fc_atualizar_saldo_carteira()
returns trigger as $$
    begin
    --compra aprovada
    if (new.status = 'aprovado' and old.status != 'aprovado') then 
        update usuarios
        set saldo_carteira = saldo_carteira - new.total
        where id_usuario = new.fk_usuario;
    --compra reembolsada/cancelada 
    elseif new.status in (('cancelado', 'reembolsado') and old.status = 'aprovado') then
        update usuarios 
        set saldo_carteira = saldo_carteira - old.total
        where id_usuario = new.fk_usuario;    
    end if; 
        return new;
    end;
$$ language plpgsql;

--TRIGGER ATUALIZAÇÃO SALDO 
create trigger trg_atualizacao_saldo
after update of status on compras 
for each row 
execute function fc_atualizar_saldo_carteira();


-- ATUALIZAÇÃO AVALIAÇÃO MEDIA
create or replace function fc_atualizar_avaliacao_media()
returns trigger as $$
begin
    update jogos 
    set avaliacao_media = (
        select avg(nota)::decimal(3,2) 
        from avaliacoes 
        where fk_jogo = new.fk_jogo
    ),
    total_avaliacoes = (
        select count(*) 
        from avaliacoes 
        where fk_jogo = new.fk_jogo
    )
    where id_jogo = new.id_jogo;
    
    return new;
end;
$$ language plpgsql;

--TRIGGER AVALIAÇÃO
create trigger tgr_atualizacao_avaliacao
after insert or UPDATE on avaliacoes
for each row 
execute function fc_atualizar_avaliacao_media();
