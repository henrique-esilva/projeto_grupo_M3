DELETE FROM curso WHERE id_curso>0;
LOAD DATA INFILE 'curso.revisado.csv' INTO TABLE curso
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT * FROM curso;

DELETE FROM turno WHERE id_turno>0;
INSERT INTO turno(id_turno, periodo, hora_inicio, hora_termino) VALUES
(1, 'manhã','08:00','12:00'),
(2, 'tarde','13:00','17:00'),
(3, 'noite','18:00','22:00');
SELECT * FROM turno;

DELETE FROM turmas WHERE id_turma>0;
LOAD DATA INFILE 'turmas.revisado.csv' INTO TABLE turmas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET data_inicio=NULL, data_fim=NULL;
SELECT * FROM turmas;

DELETE FROM alunos WHERE id_aluno>0;
LOAD DATA INFILE 'alunos.revisado.csv' INTO TABLE alunos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET log_in=NULL, log_out=NULL;
SELECT * FROM alunos;

DELETE FROM facilitadores WHERE id_facilitador>0;
LOAD DATA INFILE 'facilitadores.revisado.csv' INTO TABLE facilitadores
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT * FROM facilitadores;
