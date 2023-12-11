USE alpha;

-- pesquisas simples
SELECT * FROM curso;
SELECT * FROM modulo;
SELECT * FROM disciplina;
SELECT * FROM turno;
SELECT * FROM turmas;
SELECT * FROM alunos;
SELECT * FROM facilitadores;

-- quantidade de alunos
SELECT COUNT(id_aluno) FROM alunos;
-- sala da turma e o curso que é feito
SELECT turmas.sala, nome_curso AS curso FROM curso INNER JOIN turmas;
-- quantidade de alunos por turma
SELECT COUNT(id_aluno) AS 'N alunos', turmas.id_turma FROM alunos INNER JOIN turmas ON alunos.id_turma=turmas.id_turma GROUP BY turmas.id_turma;
-- quantidade de turmas por curso
SELECT COUNT(turmas.id_turma) AS 'n de turmas', curso.nome_curso FROM turmas INNER JOIN curso ON turmas.id_curso = curso.id_curso GROUP BY curso.nome_curso;
-- quantidade de alunos por curso
SELECT count(id_aluno) AS 'alunos', nome_curso FROM curso INNER JOIN turmas ON turmas.id_curso=curso.id_curso INNER JOIN alunos ON alunos.id_turma=turmas.id_turma GROUP BY nome_curso;
-- relacionamento entre módulos e turmas
SELECT turmas.id_turma, modulo.nome as 'módulo' FROM turmas
INNER JOIN curso ON curso.id_curso=turmas.id_curso
INNER JOIN modulo ON modulo.id_curso=curso.id_curso ORDER BY turmas.id_turma;
-- relacionamento entre módulos e nomes dos cursos
SELECT nome_curso AS 'curso', modulo.nome AS 'módulo', modulo.id_modulo FROM modulo INNER JOIN curso ON curso.id_curso=modulo.id_curso;
-- nome do curso, módulo e disciplina
SELECT nome_curso AS 'curso', modulo.nome AS 'módulo', disciplina.nome AS 'disciplina' FROM curso INNER JOIN modulo ON modulo.id_curso=curso.id_curso INNER JOIN disciplina ON disciplina.id_modulo=modulo.id_modulo;
