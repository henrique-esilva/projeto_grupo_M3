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

CREATE TABLE facilitadores(
id_facilitador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(150) NOT NULL,
nascimento DATE NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(17) NOT NULL,
especialidade VARCHAR(20)
);

CREATE TABLE turmas(
id_turma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sala VARCHAR(10) NOT NULL,
especialidade VARCHAR(20) NOT NULL,
nivel VARCHAR(20) NOT NULL,
inicio DATE NOT NULL,
final DATE NOT NULL,
periodo VARCHAR(12) NOT NULL,
id_facilitador INT
);
ALTER TABLE turmas ADD CONSTRAINT fk_facilitador
FOREIGN KEY (id_facilitador) REFERENCES facilitadores (id_facilidador);

CREATE TABLE alunos_turmas(
id_aluno INT,
id_turma INT,
PRIMARY KEY (id_aluno, id_turma),
FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);
