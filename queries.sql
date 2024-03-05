CREATE DATABASE Curso

use Curso

go

CREATE TABLE TB_ESTADO(

SIGLA_ESTADO		CHAR(2) NOT NULL,

NOME_ESTADO			VARCHAR(40)

)

CREATE TABLE TB_CLASSE(

ID_CLASSE			SMALLINT NOT NULL,

ID_ANDAR			SMALLINT

)

CREATE TABLE TB_ALUNO(

COD_ALUNO			SMALLINT NOT NULL,

NOME_ALUNO			VARCHAR(45),

END_ALUNO			VARCHAR(100),

SIGLA_ESTADO		CHAR(2),

ID_CLASSE			SMALLINT

)

CREATE TABLE TB_PROFESSOR(

ID_PROFESSOR		CHAR(3) NOT NULL,

NOME_PROFESSOR		VARCHAR(25)

)

CREATE TABLE TB_DISCIPLINA(

ID_DISCIPLINA		CHAR(3) NOT NULL,

NOME_DISCIPLINA		VARCHAR(15),

ID_PROFESSOR_DISCIPLINA CHAR(3),

NOTA_MINIMA_DISCIPLINA  SMALLINT

)

CREATE TABLE TB_ALUNO_DISCIPLINA(

COD_ALUNO			SMALLINT NOT NULL,

ID_DISCIPLINA		CHAR(3) NOT NULL,

NOTA_ALUNO			SMALLINT

)
 
ALTER TABLE TB_ESTADO add CONSTRAINT pkSIGLA_ESTADO Primary Key (SIGLA_ESTADO)

ALTER TABLE TB_CLASSE add CONSTRAINT pkID_CLASSE Primary Key (ID_CLASSE)

ALTER TABLE TB_ALUNO add CONSTRAINT pkCOD_ALUNO Primary Key (COD_ALUNO)

ALTER TABLE TB_PROFESSOR add CONSTRAINT pkID_PROFESSOR Primary Key (ID_PROFESSOR)

ALTER TABLE TB_DISCIPLINA add CONSTRAINT pkID_DISCIPLINA Primary Key (ID_DISCIPLINA)

ALTER TABLE TB_ALUNO_DISCIPLINA add CONSTRAINT pkCOD_ALUNO_DISCIPLINA Primary Key (COD_ALUNO,ID_DISCIPLINA)
 
 
ALTER TABLE TB_ALUNO ADD CONSTRAINT FK_TB_ALUNO_TB_ESTADO FOREIGN KEY (SIGLA_ESTADO) REFERENCES TB_ESTADO(SIGLA_ESTADO)

ALTER TABLE TB_ALUNO ADD CONSTRAINT FK_TB_ALUNO_TB_CLASSE FOREIGN KEY (ID_CLASSE) REFERENCES TB_CLASSE(ID_CLASSE)

ALTER TABLE TB_ALUNO_DISCIPLINA ADD CONSTRAINT FK_TB_ALUNO_DISCIPLINA_TB_ALUNO FOREIGN KEY (COD_ALUNO) REFERENCES TB_ALUNO(COD_ALUNO)

ALTER TABLE TB_ALUNO_DISCIPLINA ADD CONSTRAINT FK_TB_ALUNO_DISCIPLINA_TB_DISCIPLINA FOREIGN KEY (ID_DISCIPLINA) REFERENCES TB_DISCIPLINA(ID_DISCIPLINA)

ALTER TABLE TB_DISCIPLINA ADD CONSTRAINT FK_TB_DISCIPLINA_TB_PROFESSOR FOREIGN KEY (ID_PROFESSOR_DISCIPLINA) REFERENCES TB_PROFESSOR(ID_PROFESSOR)
 
INSERT INTO TB_ESTADO(SIGLA_ESTADO, NOME_ESTADO) VALUES ('SP', 'São Paulo')
 
INSERT INTO TB_CLASSE(ID_CLASSE, ID_ANDAR) VALUES (1, 1), (2, 2), (3, 3)
 
INSERT INTO TB_PROFESSOR(ID_PROFESSOR, NOME_PROFESSOR) VALUES

('JOI', 'JOILSON CARDOSO'),

('OSE', 'OSEAS SANTANA'),

('VIT', 'VITOR VASCONCELOS'),

('FER', 'JOSE ROBERTO FERROLI'),

('LIM', 'VALMIR LIMA'),

('EDS', 'EDSON SILVA'),

('WAG', 'WAGNER OKIDA')
 
INSERT INTO TB_ALUNO(COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) VALUES

(1, 'ANTONIO CARLOS PENTEADO', 'RUA X', 'SP', '1'),

(2, 'AUROMIR DA SILVA VALDEVINO', 'RUA W', 'SP', '1'),

(3, 'ANDRE COSTA', 'RUA T', 'SP', '1'),

(4, 'ROBERTO SOARES DE MENEZES', 'RUA BW', 'SP', '2'),

(5, 'DANIA', 'RUA CCC', 'SP', '2'),

(6, 'CARLOS MAGALHAES', 'AV SP', 'SP', '2'),

(7, 'MARCELO RAUBA', 'AV SAO LUIS', 'SP', '3'),

(8, 'FERNANDO', 'AV COUNTYR', 'SP', '3'),

(9, 'WALMIR BURIN', 'RUA SSISIS', 'SP', '3')
 
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) VALUES

('MAT', 'MATEMATICA', 'JOI', 7),

('POR', 'PORTUGUES', 'VIT', 5),

('FIS', 'FISICA', 'OSE', 3),

('HIS', 'HISTORIA', 'EDS', 2),

('GEO', 'GEOGRAFIA', 'WAG', 4),

('ING', 'INGLES', 'LIM', 2)
 
INSERT INTO TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) VALUES

(1, 'MAT', 0),

(2, 'MAT', 0),

(3, 'MAT', 1),

(4, 'POR', 2),

(5, 'POR', 2),

(6, 'POR', 2),

(7, 'FIS', 3),

(8, 'FIS', 3),

(9, 'FIS', 3),

(1, 'POR', 2),

(2, 'POR', 2),

(7, 'POR', 2),

(1, 'FIS', 3)

/*
TILIZANDO O MODELO DE DADOS DE CURSO:

A-    Exercícios de SELECT básico                              

1). Queremos selecionar todos os alunos cadastrados.

*/
select*from TB_ALUNO


/*

2). Queremos selecionar todos os nomes de disciplina,
cujo a nota mínima seja maior que 5 ( cinco ).

*/
select*from TB_DISCIPLINA
where NOTA_MINIMA_DISCIPLINA  >5

/*

3). Queremos selecionar todas disciplinas que tenham
nota mínima entre 3 (três) e 5 (cinco).
 */

 select*from TB_DISCIPLINA
 where NOTA_MINIMA_DISCIPLINA >=3 and NOTA_MINIMA_DISCIPLINA >5
 /*



B-    Exercícios de SELECT (Ordenando e agrupando dados)

1). Queremos selecionar todos os alunos em ordem alfabética de nome de aluno, e também o número da classe que estuda.
 
*/
 select  aluno.NOME_ALUNO as 'nome do aluno',  classe.ID_CLASSE as 'Numero da classe'
from TB_ALUNO  aluno inner join TB_CLASSE classe on 
 aluno.ID_CLASSE= classe.ID_CLASSE
 order by aluno.NOME_ALUNO asc
 select*from TB_DISCIPLINA
/*

2). Selecionaremos o item anterior, porém ordenado alfabeticamente pelo identificador do aluno de forma descendente  (ascendente é “default”). .
*/
 select  aluno.NOME_ALUNO as 'nome do aluno',  classe.ID_CLASSE as 'Numero da classe'
from TB_ALUNO  aluno inner join TB_CLASSE classe on 
 aluno.ID_CLASSE= classe.ID_CLASSE
 order by classe.ID_CLASSE desc
/*
diciplina.NOME_DISCIPLINA


*/
select aluno.NOME_ALUNO as 'nome do aluno', dis.ID_DISCIPLINA as ' id da diciplina' , diciplina.NOME_DISCIPLINA as 'diciplina nome'
from TB_ALUNO aluno inner join TB_ALUNO_DISCIPLINA dis on 
aluno.COD_ALUNO= dis.COD_ALUNO 
inner join TB_DISCIPLINA diciplina on 
dis.ID_DISCIPLINA=diciplina.ID_DISCIPLINA
where dis.ID_DISCIPLINA like '%MAT%' and dis.ID_DISCIPLINA like '%POR%'

/*
C-    Exercícios de SELECT (Junção de Tabelas)

1). Queremos selecionar todos os nomes de alunos que cursam Português ou Matemática.

*/
select aluno.NOME_ALUNO as 'nome do aluno', dis.ID_DISCIPLINA as ' id da diciplina', diciplina.NOME_DISCIPLINA as 'diciplina nome'
from TB_ALUNO aluno inner join TB_ALUNO_DISCIPLINA dis on 
aluno.COD_ALUNO= dis.COD_ALUNO 
inner join TB_DISCIPLINA diciplina on 
dis.ID_DISCIPLINA=diciplina.ID_DISCIPLINA
where diciplina.NOME_DISCIPLINA like '%MAT%' or diciplina.NOME_DISCIPLINA like '%POR%'
/*
2). Queremos selecionar todos os nomes de alunos cadastrados que cursam  a disciplina FÍSICA e seus respectivos endereços .

*/
select aluno.NOME_ALUNO as 'nome do aluno', dis.ID_DISCIPLINA as ' id da diciplina', diciplina.NOME_DISCIPLINA as 'diciplina nome', aluno.END_ALUNO as 'Endereço'
from TB_ALUNO aluno inner join TB_ALUNO_DISCIPLINA dis on 
aluno.COD_ALUNO= dis.COD_ALUNO 
inner join TB_DISCIPLINA diciplina on 
dis.ID_DISCIPLINA=diciplina.ID_DISCIPLINA
where diciplina.NOME_DISCIPLINA like '%Fisica%'

/*

3). Queremos selecionar todos os nomes de alunos cadastrados que cursam física e o andar que se encontra a classe dos mesmos.
*/
SELECT A.NOME_ALUNO, D.NOME_DISCIPLINA , CAST(C.ID_ANDAR AS VARCHAR(2))+','+ CAST(C.ID_CLASSE AS varchar(2)) AS ANDAR_CLASSE
FROM TB_ALUNO A, TB_DISCIPLINA D, TB_ALUNO_DISCIPLINA AD, TB_CLASSE C
WHERE A.COD_ALUNO = AD.COD_ALUNO
AND A.ID_CLASSE = C.ID_CLASSE
AND AD.ID_DISCIPLINA = D.ID_DISCIPLINA
AND D.NOME_DISCIPLINA LIKE 'FIS%'

/*

D-    Exercícios de SELECT (OUTER JOIN)

1.    Selecionar todos os Professores com suas respectivas disciplinas e os demais Professores que não lecionam disciplina alguma.
*/

SELECT P.NOME_PROFESSOR , D.NOME_DISCIPLINA
FROM TB_PROFESSOR P LEFT OUTER JOIN TB_DISCIPLINA D
ON D.ID_PROFESSOR_DISCIPLINA =P.ID_PROFESSOR


/*
E-    Exercícios de SELECT (USE Clausula IN e/ou SUBSelect).
Não pode usar junção.
1.    Selecionar todos os nomes de professores que tenham ministrado disciplina para alunos que sejam do Estado do Piaui,
cujo a classe tenha sido no terceiro andar.
*/
SELECT
	NOME_PROFESSOR
FROM TB_PROFESSOR
WHERE ID_PROFESSOR IN (
SELECT ID_PROFESSOR FROM TB_DISCIPLINA WHERE ID_DISCIPLINA IN (
SELECT ID_DISCIPLINA FROM TB_ALUNO DISCIPLINA WHERE COD_ALUNO IN (
SELECT COD_ALUNO FROM TB_ALUNO WHERE SIGLA_ESTADO = 'PI'
)
)
);
