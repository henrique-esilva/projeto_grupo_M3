CREATE DATABASE alpha;
USE alpha;

CREATE TABLE alunos(
id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
id_curso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR (20) NOT NULL,
id_disciplina INT (10) NOT NULL,
carga_horaria VARCHAR (10) NOT NULL,
turno VARCHAR (20) NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL
);

CREATE TABLE modulo(
id_modulo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (20) NOT NULL,
carga_horaria INT NOT NULL,
id_curso INT NOT NULL 
);

CREATE TABLE facilitadores(
id_facilitador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(150) NOT NULL,
nascimento DATE NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(17) NOT NULL,
id_disciplina INT NOT NULL
);

CREATE TABLE turmas(
id_turma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
id_disciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_modulo INT NOT NULL,
nome VARCHAR(30) NOT NULL
);

CREATE TABLE turno(
id_turno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
periodo VARCHAR(12) NOT NULL
);

CREATE TABLE alunos_has_turmas(
alunos_id_aluno INT NOT NULL,
turmas_id_turma INT NOT NULL
);

ALTER TABLE alunos_has_turmas
ADD CONSTRAINT fk_alunos_has_turmas__alunos FOREIGN KEY (alunos_id_aluno) REFERENCES alunos (id_aluno),
ADD CONSTRAINT fk_alunos_has_turmas__turmas FOREIGN KEY (turmas_id_turma) REFERENCES turmas (id_turma);ALTER TABLE turno

ALTER TABLE turno  
ADD COLUMN hora_inicio TIME;

ALTER TABLE turno
ADD COLUMN hora_termino TIME;









