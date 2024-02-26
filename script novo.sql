--- Instruções SQL para a criação da estrutura das tabelas



create table usuario (
	id serial primary key,
	nome varchar(100) not null,
	username varchar(20) not null,
	email varchar(100) not null,
	senha varchar(50) not null
) 
insert into usuario (nome, username, email, senha) values (
	'Guilherme Gomes',
	'Ga',
	'guigochefe@gmail.com',
	'guigc2021'
)


create table nutricionista (
	id serial primary key,
	usuario_id int not null,
	conselho varchar(20) not null,
	especialidade text,
	constraint usuario_fk foreign key(usuario_id) references usuario(id)
)
insert into nutricionista (usuario_id, conselho,especialidade) values (
	1,
	'teste1234',
	'nutrição'
)


create table paciente (
	id serial primary key,
	nome varchar(100) not null,
	endereco varchar(150) not null,
	cep varchar(8) not null,
	nascimento date,
	telefone varchar(11),
	usuario_id int not null,
	constraint usuario_fk foreign key(usuario_id) references usuario(id)
)

insert into paciente (nome, endereco, cep, nascimento, telefone, usuario_id) values (
	'Guilherme Gomes',
	'Rua Paulo Cunha, 33',
	'64000110',
	'30/04/2007',
	'86981859524',
	2
)

create table consulta (
	id serial primary key,
	usuario_id int not null,
	paciente_id int not null,
	anamnese text not null,
	constraint usuario_fk foreign key(usuario_id) references usuario(id),
	constraint paciente_fk foreign key(paciente_id) references paciente(id)
)

insert into consulta (usuario_id, paciente_id, anamnese) values (
	1,
	2,
	'Paciente bem cabeçudo'
	
)

create table avaliacao (
	id serial primary key,
	consulta_id int not null,
	resultado text not null,
	constraint consulta_fk foreign key (consulta_id) references consulta(id)
)

insert into avaliacao (consulta_id, resultado) values (
	3,
	'Paciente frango quer ficar fortão'
)

create table exame (
	id serial primary key,
	consulta_id int not null,
	resultado text not null,
	constraint consulta_fk foreign key (consulta_id) references consulta(id)
)

insert into exame (consulta_id, resultado) values (
	3,
	'Pouca massa muscular, magro demais'
)

create table alimento(
	id serial primary key,
	nome varchar(50) not null,
	caloria int not null
)
insert into alimento (nome, caloria) values (
	'Leite Integral',
	114
)

create table plano_alimentar (
	id serial primary key,
	consulta_id int not null,
	alimento_id int not null,
	constraint consulta_fk foreign key (consulta_id) references consulta(id),
	constraint alimento_fk foreign key (alimento_id) references alimento(id)	
)

insert into plano_alimentar (consulta_id, alimento_id) values (
	3,
	18
)

create table agenda (
	id serial primary key,
	usuario_id int not null,
	paciente_id int not null,
	data_consulta date not null,
	hora_consulta time not null,
	obs varchar(100),
	constraint usuario_fk foreign key (usuario_id) references usuario(id),
	constraint paciente_fk foreign key (paciente_id) references paciente(id)
)

insert into agenda (usuario_id, paciente_id, data_consulta, hora_consulta, obs) values ( 
	3,
	1,
	'12/04/2023',
	'17:49',
	'imbecil quer ficar forte'
)

-- Instruções SQL para inserção de dados nas tabelas

insert into usuario (nome, username, email, senha) values (
	'Tasso',
	'Chicoin',
	'tassomaisdogi@gmail.com',
	'flinston1234'
)

-- Instruções SQL para selecionar dados nas tabelas
select * from nutricionista

