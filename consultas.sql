/*markdown
---
## <center> **CRIAÇÃO DAS TABELAS** </center>
*/

/*markdown
------------------------------------
- Professor (ID, nome, rua, cidade, bairro, email, data de nascimento);
- Aluno (ID, nome, rua, cidade, bairro, data de nascimento);
- Matrícula (ID do aluno, código disciplina, ano);
- Disciplina (ID, nome da disciplina, nome do curso, quantidade de aulas);
- Professor da disciplina (ID da disciplina, ID do professor, ano).
*/

CREATE TABLE IF NOT EXISTS professor (
    ID_prof SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nome_prof VARCHAR(100) NOT NULL,
    rua_prof VARCHAR (255),
    cidade_prof VARCHAR(100),
    bairro_prof VARCHAR (100),
    email_prof VARCHAR(255) NOT NULL,
    nasc_prof DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS aluno(
    ID_aluno SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR (255) NOT NULL,
    rua_aluno VARCHAR(255),
    cidade_aluno VARCHAR(255),
    bairro_aluno VARCHAR(100),
    nasc_aluno DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS disciplina(
    ID_disc SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nome_disc VARCHAR(100) NOT NULL,
    nome_curso VARCHAR(100) NOT NULL,
    quantidade_aulas INT NOT NULL
);

CREATE TABLE IF NOT EXISTS matricula(
    ID_aluno SMALLINT NOT NULL,
    ID_disc SMALLINT  NOT NULL,
    ano YEAR NOT NULL,
    CONSTRAINT ID_matricula PRIMARY KEY (ID_aluno, ID_disc, ano),
    CONSTRAINT matricula_aluno_fk FOREIGN KEY (ID_aluno)
        REFERENCES aluno(ID_aluno),
    CONSTRAINT matricula_disc_fk FOREIGN KEY (ID_disc)
        REFERENCES disciplina(ID_disc)
);

CREATE TABLE IF NOT EXISTS prof_disc(
    ID_prof SMALLINT NOT NULL,
    ID_disc SMALLINT NOT NULL,
    ano YEAR NOT NULL,
    CONSTRAINT prof_disc_pk PRIMARY KEY (ID_disc, ID_prof, ano),
    CONSTRAINT prof_disc_fk FOREIGN KEY (ID_disc)
        REFERENCES disciplina (ID_disc),
    CONSTRAINT ID_prof_fk FOREIGN KEY (ID_prof)
        REFERENCES professor (ID_prof)
);

/*markdown
--------
## <center>**INSERÇÃO DE DADOS:**</center>
*/

/*markdown
---------------------------
### Tabela alunos:
*/

DESCRIBE aluno

INSERT INTO aluno (nome_aluno, rua_aluno, cidade_aluno, bairro_aluno, nasc_aluno)
VALUES
    ('Tiago Mateus', 'Rua 210', 'Palmas', 'Palmeira Doida', '2012-03-15'),
    ('Luciana Gomes', 'Rua 202', 'Palmas', 'Orla 14', '2011-12-29'),
    ('João Mateus', 'Rua 2300', 'Gurpi', 'Arso 52', '2014-08-20'),    
    ('Bruno Tadeu', 'Rua Alvorada', 'Paraiso', 'Carcara', '2008-06-14'),
    ('Marcos Vinicius', 'Rua Santa Barbara', 'Paraiso', 'Carcara', '2009-08-23')

INSERT INTO aluno (nome_aluno, nasc_aluno)
VALUES 
    ('Juraci', '2012-03-15'),
    ('Paulo', '2010-05-10'),
    ('Adriana Calcanhoto', '2008-05-25'),
    ('Rosane', '2012-01-17'),
    ('Mara', '2011-02-22'),
    ('Julia', '2009-03-15'),
    ('Julia', '2013-08-29')

SELECT * 
FROM aluno

/*markdown
------------------------------
### Tabela professor:
*/

DESCRIBE professor

INSERT INTO professor (nome_prof, rua_prof, cidade_prof, email_prof, nasc_prof)
VALUES ('João José', '103', 'Palmas', 'JoaoJose@gmail.com', '1998-03-15'),
    ('Maria José', '201', 'Palmas', 'maria_Jose123@gmail.com', '1987-11-23'),
    ('Bruno', '305', 'Paraiso', 'brunoProf999@gmail.com', '1999-06-14'),
    ('José Ricardo', '1106', 'Porto Nacional', 'jose_ricardo770@gmail.com', '1979-04-25'),
    ('Manuela', '120', 'Araguaína', 'manu_arara@gmail.com', '2000-06-02'),
    ('Bruno', '1003', 'Porto Nacional', 'drumond770@gmail.com', '1999-06-14'),
    ('Luciana', ' 100', 'Miracema', 'lulu_ana@yahoo.com', '1997-08-02'),
    ('Paulo', ' 150', 'Palmas', 'pauloReg@outlook.com', '1990-10-27'),
    ('Lual', '1006', 'Paraíso', 'lua_ala@gmail.com', '2000-09-13'),
    ('Antonio Marcos', '170', 'Araguaína', 'tonhoMarcos@outlook.com', '1989-12-10')

SELECT *
FROM professor

/*markdown
--------------------------
### Tabela disciplina:
*/

DESCRIBE disciplina

INSERT INTO disciplina (nome_disc, nome_curso, quantidade_aulas) 
VALUES 
    ('Química', 'Ensino Médio', 4),
    ('Biologia', 'Ensino Médio', 4),
    ('História', 'Ensino Médio', 2),
    ('Religião', 'Ensino Médio', 2),
    ('Português', 'Ensino Pós Médio', 4),
    ('Física', 'Ensino Pós Médio', 6),
    ('Matemática', 'Ensino Pós Médio', 4),
    ('Geografia ', 'Ensino Pós Médio', 2),
    ('Informática Aplicada', 'CST Sistemas para Internet', 4),
    ('Banco de dados', 'CST Sistemas para Internet', 4),
    ('Programação de Banco de dados', 'Computação', 4)

SELECT *
FROM disciplina

/*markdown
----------------------------
### Tabela matricula:
*/

INSERT INTO matricula (ID_aluno, ID_disc, ano) 
VALUES 
    (1, 10, '2018'),
    (1, 4, '2018'),
    (1, 6, '2018'),
    (5, 3, '2018'),
    (6, 1, '2018'),
    (2, 6, '2018'),
    (7, 9, '2018'),
    (8, 10, '2018'),
    (9, 1, '2018'),
    (2, 2, '2018'),
    (11, 11, '2018')

SELECT *
FROM matricula

/*markdown
------------------------------
### Tabela Prof_Disc:
*/

DESCRIBE prof_disc

INSERT INTO prof_disc (ID_disc, ID_prof, ano) 
VALUES 
    (1, 10, '2018'),
    (2, 5, '2018'),
    (3, 7, '2018'),
    (4, 4, '2018'),
    (5, 9, '2018'),
    (6, 2, '2018'),
    (7, 3, '2018'),
    (8, 9, '2018'),
    (9, 6, '2018'),
    (10, 3, '2018'),
    (11, 5, '2018')

SELECT *
FROM prof_disc

/*markdown
-----------------------------------------------------------------------------------------
*/

/*markdown
## <center>**CONSULTAS:**</center>
*/

/*markdown
-------------
*/

/*markdown
1 – Crie uma consulta com todas as disciplinas oferecidas no ano de 2018, constando os nomes das disciplinas, nomes e cidades dos professores responsáveis e nomes dos cursos das disciplinas.
*/

SELECT
    professor.nome_prof AS Nome_Professor,
    disciplina.nome_disc AS Nome_Disciplina,
    professor.cidade_prof AS Cidade_Professor,
    disciplina.nome_curso AS Nome_Curso
FROM 
    prof_disc
INNER JOIN 
    disciplina ON disciplina.ID_disc = prof_disc.ID_disc
INNER JOIN 
    professor ON professor.ID_prof = prof_disc.ID_prof
ORDER BY
    professor.nome_prof

/*markdown
2 –  Crie uma consulta que mostre todos os nomes dos professores do curso de CST Sistemas para Internet, no ano de 2018, e os nomes das disciplinas pelas quais são responsáveis.
*/

SELECT 
    professor.nome_prof AS Nome_Professor, 
    disciplina.nome_disc AS Nome_Disciplina
FROM 
    prof_disc
INNER JOIN 
    disciplina ON disciplina.ID_disc = prof_disc.ID_disc
INNER JOIN
    professor ON professor.ID_prof = prof_disc.ID_prof
WHERE
    disciplina.nome_curso LIKE '%CST%'


/*markdown
3 – Crie uma consulta com todos os nomes de alunos matriculados no ano de 2018, os nomes das disciplinas em que estão matriculados, a cidade onde moram e os nomes dos cursos das disciplinas.
*/

-- nome do aluno, nome da disciplina, cidade do aluno, nome dos cursos das disciplinas
SELECT 
    aluno.nome_aluno AS Nome_Aluno,
    disciplina.nome_disc AS Nome_Disciplina,
    aluno.cidade_aluno AS Cidade_Aluno,
    disciplina.nome_disc AS Nome_Disciplina
FROM
    matricula
INNER JOIN
    aluno ON aluno.ID_aluno = matricula.ID_aluno
INNER JOIN
    disciplina ON disciplina.ID_disc = matricula.ID_disc
