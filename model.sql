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
escolaridade VARCHAR(30) NOT NULL,
log_in TIME,
log_out TIME,
id_turma INT
);

CREATE TABLE curso(
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome_curso VARCHAR (64) NOT NULL,
carga_horaria VARCHAR (10) NOT NULL
);

CREATE TABLE modulo(
id_modulo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (20) NOT NULL,
carga_horaria INT NOT NULL,
id_curso INT NOT NULL
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

CREATE TABLE presenca (
id_presenca INT PRIMARY KEY AUTO_INCREMENT,
id_turma INT,
id_aluno INT,
tipo VARCHAR(3),
horario TIME,
dia DATE
);

CREATE TABLE alunos_has_turmas(
  id_aluno INT NOT NULL,
  id_turma INT NOT NULL
);

CREATE TABLE disciplina(
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
id_facilitador INT NOT NULL,
id_modulo INT NOT NULL,
nome VARCHAR(30) NOT NULL
);

CREATE TABLE turno(
id_turno INT PRIMARY KEY AUTO_INCREMENT,
periodo VARCHAR(12) NOT NULL,
hora_inicio TIME,
hora_termino TIME
);


-- ALTER TABLE modulo ADD CONSTRAINT fk_modulo_turmas FOREIGN KEY (id_turma) REFERENCES turmas(id_turma);
ALTER TABLE alunos ADD CONSTRAINT fk_alunos_turmas FOREIGN KEY (id_turma) REFERENCES turmas(id_turma);


ALTER TABLE disciplina ADD CONSTRAINT fk_disciplina_modulo FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo);
ALTER TABLE turmas ADD CONSTRAINT fk_turmas_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno);
ALTER TABLE turmas ADD CONSTRAINT fk_turmas_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso);
ALTER TABLE disciplina ADD CONSTRAINT fk_disciplina_facilitadores FOREIGN KEY (id_facilitador) REFERENCES facilitadores(id_facilitador);
ALTER TABLE modulo ADD CONSTRAINT fk_modulo_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso);

/*
-- relacionamento muitos para muitos - provável que não seja mais usado
ALTER TABLE alunos_has_turmas
  ADD CONSTRAINT fk_alunos_has_turmas__alunos FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
  ADD CONSTRAINT fk_alunos_has_turmas__turmas FOREIGN KEY (id_turma) REFERENCES turmas (id_turma);
*/

DELIMITER //
CREATE DEFINER='root'@'localhost' TRIGGER gera_log_alunos BEFORE UPDATE ON alunos FOR EACH ROW BEGIN
IF (NEW.log_in != OLD.log_in) THEN
	INSERT INTO presenca(id_presenca, id_turma, id_aluno, tipo, horario, dia)
	VALUES (NULL, OLD.id_turma, OLD.id_aluno, 'in', NOW(), NOW());
END IF;
IF (NEW.log_out != OLD.log_out) THEN
	INSERT INTO presenca(id_turma, id_aluno, tipo, horario, dia)
	VALUES (NULL, OLD.id_turma, OLD.id_aluno, 'out', NOW(), NOW());
END IF;
END //
DELIMITER ;
