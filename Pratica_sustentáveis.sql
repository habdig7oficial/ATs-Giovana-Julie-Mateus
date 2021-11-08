/* Create the new database */
CREATE DATABASE Sustentabilidade
GO

USE Sustentabilidade

/* Create a new table called 'pratica' in schema 'PraticaSustentavel'*/

CREATE TABLE PraticaSustentavel 
(
    praticaId INT PRIMARY KEY IDENTITY(1,1), /*primary key column*/

    Data_de_ocorrencia DATE NOT NULL,
    Localizacao VARCHAR(100) NOT NULL,
    acao VARCHAR(100) NOT NULL
    
);


CREATE TABLE UsuarioPraticaSustentavel
(
    usuarioId INT PRIMARY KEY IDENTITY(1,1), /*primary key column*/

    nome VARCHAR(30) NOT NULL,
    data_de_registro DATE NOT NULL,
    telefone CHAR(9) NOT NULL
    
);


CREATE TABLE PraticaSustentavel_UsuarioPraticaSustentavel
(
    localid INT PRIMARY KEY IDENTITY(1,1), /*primary key column*/

    id_pratica_this INT NOT NULL
    CONSTRAINT fk_PraticaSustentavel_this FOREIGN KEY (id_pratica_this) REFERENCES PraticaSustentavel(praticaId),

    id_usuario_this INT NOT NULL 
    CONSTRAINT fk_UsuarioPraticaSustentavel_this FOREIGN KEY (id_usuario_this) REFERENCES UsuarioPraticaSustentavel (usuarioId )
)

GO



/* Create a new stored procedure called 'inserir_PraticaSustentavel' in schema 'SchemaName'*/

CREATE PROCEDURE  inserir_PraticaSustentavel
    @data_de_ocorrencia /*parameter name*/ DATE /*datatype_for_data_de_ocorrencia*/  ,
    @localizacao /*parameter name*/ VARCHAR(100) /*datatype_for_data_de_ocorrencia*/ ,
    @acao /*parameter name*/ VARCHAR(100) /*datatype_for_acao*/ 

AS


    /* body of the stored procedure*/
    INSERT INTO PraticaSustentavel (Data_de_ocorrencia,Localizacao,acao) VALUES(@data_de_ocorrencia, @localizacao, @acao) SELECT * from PraticaSustentavel
    
    
GO
/* example to execute the stored procedure we just created*/

GO

EXEC inserir_PraticaSustentavel '28-08-2021','rua legal','coleta de lixo'


/* Create a new stored procedure called 'inserir_Usuario' in schema 'SchemaName'*/

GO

CREATE PROCEDURE inserir_Usuario   
@nome /*parameter name*/ VARCHAR(30) /*datatype_for_nome*/  ,    
@data_de_registro /*parameter name*/ DATE /*datatype_for_nome*/   ,    
@telefone CHAR(9)

AS   /* body of the stored procedure*/       

INSERT INTO UsuarioPraticaSustentavel (nome,data_de_registro,telefone) VALUES(@nome, @data_de_registro, @telefone) SELECT * from UsuarioPraticaSustentavel GO


EXEC inserir_Usuario 'mateus','05-07-06','123456789'

GO


/*Create a new stored procedure called 'relacao' in schema 'SchemaName'*/
GO
/*Create the stored procedure in the specified schema*/
CREATE PROCEDURE relacao
    @id_pratica_this /*parameter name*/ int /*datatype_for_id_pratica_this*/ ,
    @id_usuario_this /*parameter name*/ int /*datatype_for_id_pratica_this*/  
/*add more stored procedure parameters here*/
AS
    /*body of the stored procedure*/
 INSERT INTO PraticaSustentavel_UsuarioPraticaSustentavel (id_pratica_this,id_usuario_this) VALUES( @id_pratica_this,@id_usuario_this) /*select with Inner Join*/
GO
/*example to execute the stored procedure we just created*/

GO


GO
/*Create the stored procedure in the specified schema*/

EXEC relacao 1,1




SELECT PraticaSustentavel.Data_de_ocorrencia, PraticaSustentavel.Localizacao ,PraticaSustentavel.acao, UsuarioPraticaSustentavel.nome, UsuarioPraticaSustentavel.data_de_registro,UsuarioPraticaSustentavel.telefone
FROM PraticaSustentavel
INNER JOIN PraticaSustentavel_UsuarioPraticaSustentavel
ON PraticaSustentavel.praticaId = PraticaSustentavel_UsuarioPraticaSustentavel.id_pratica_this
INNER JOIN UsuarioPraticaSustentavel
ON UsuarioPraticaSustentavel.usuarioId = PraticaSustentavel_UsuarioPraticaSustentavel.id_usuario_this
WHERE praticaId = 1

SELECT PraticaSustentavel.Data_de_ocorrencia, PraticaSustentavel.Localizacao ,PraticaSustentavel.acao, UsuarioPraticaSustentavel.nome, UsuarioPraticaSustentavel.data_de_registro,UsuarioPraticaSustentavel.telefone
FROM PraticaSustentavel
INNER JOIN PraticaSustentavel_UsuarioPraticaSustentavel
ON PraticaSustentavel.praticaId = PraticaSustentavel_UsuarioPraticaSustentavel.id_pratica_this
INNER JOIN UsuarioPraticaSustentavel
ON UsuarioPraticaSustentavel.usuarioId = PraticaSustentavel_UsuarioPraticaSustentavel.id_usuario_this
WHERE acao = 'coleta de lixo'

