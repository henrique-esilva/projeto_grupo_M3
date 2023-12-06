DROP DATABASE alpha;
CREATE DATABASE alpha;

USE alpha;

CREATE TABLE alunos(
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(20) NOT NULL,
nome VARCHAR(100) NOT NULL,
nascimento DATE NOT NULL,
genero VARCHAR(20) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(150) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(17) NOT NULL,
escolaridade VARCHAR(30) NOT NULL
);

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR (64) NOT NULL,
id_disciplina INT (10) NOT NULL,
carga_horaria VARCHAR (10) NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL
);

CREATE TABLE modulo(
id_modulo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (20) NOT NULL,
carga_horaria INT NOT NULL,
id_curso INT NOT NULL,
id_turma INT NOT NULL
);

CREATE TABLE facilitadores(
id_facilitador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(150) NOT NULL,
nascimento DATE NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(17) NOT NULL
);

CREATE TABLE turmas(
id_turma INT PRIMARY KEY AUTO_INCREMENT,
id_curso INT NOT NULL,
id_aluno INT NOT NULL,
sala VARCHAR(10) NOT NULL,
nivel VARCHAR(20) NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
horario_inicio TIME NOT NULL,
horario_fim TIME NOT NULL,
periodo VARCHAR(12) NOT NULL,
dia VARCHAR (20) NOT NULL,
id_turno INT NOT NULL
);

CREATE TABLE disciplina(
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
id_facilitador INT NOT NULL,
id_modulo INT NOT NULL,
nome VARCHAR(30) NOT NULL
);

CREATE TABLE turno(
id_turno INT PRIMARY KEY AUTO_INCREMENT,
periodo VARCHAR(12) NOT NULL
);

ALTER TABLE alunos
ADD COLUMN id_curso INT;

ALTER TABLE turno  
ADD COLUMN hora_inicio TIME;

ALTER TABLE turno
ADD COLUMN hora_termino TIME;

INSERT INTO curso(id_curso, nome_curso, id_disciplina, carga_horaria,  data_inicio, data_fim) VALUES
(NULL,'Análise de Dados',1, '360','2024-01-07','2024-08-07'),
(NULL,'Excel','2', '360','2024-01-07','2024-08-07'),
(NULL,'Power BI','3', '360','2024-01-07','2024-08-07'),
(NULL,'Análise e desenvolvimento de sistemas','4', '360','2024-01-07','2024-08-07'),
(NULL,'Banco de Dados(SQL)','5', '360','2024-02-08','2024-09-08'),
(NULL,'Desenvolvedor Beck-end','6', '360','2024-02-08','2024-09-08'),
(NULL,'Office 365','7', '360','2024-02-08','2024-09-08'),
(NULL,'Python','8', '360','2024-01-07','2024-08-07');
