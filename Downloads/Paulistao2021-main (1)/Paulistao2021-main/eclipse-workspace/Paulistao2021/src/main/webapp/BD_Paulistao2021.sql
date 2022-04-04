CREATE DATABASE db_paulistao
GO
USE db_paulistao

CREATE TABLE times (
	codigoTime INT NOT NULL,
	nomeTime VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estadio VARCHAR (200) NOT NULL,
	PRIMARY KEY(codigoTime)
)

CREATE TABLE grupos (
	codigoTime INT NOT NULL,
	letra VARCHAR(1) NOT NULL check(letra = 'A' OR letra = 'B' OR letra = 'C' OR letra = 'D'),
	PRIMARY KEY (codigoTime, letra),
	FOREIGN KEY (codigoTime) REFERENCES times(codigoTime)
)

CREATE TABLE jogos (
	codigoTimeA INT NOT NULL,
	codigoTimeB INT NOT NULL,
	golsTimeA INT NULL,
	golsTimeB INT NULL,
	dia DATE NULL 
	PRIMARY KEY (codigoTimeA, codigoTimeB),
	FOREIGN KEY (codigoTimeA) REFERENCES times (codigoTime),
	FOREIGN KEY (codigoTimeB) REFERENCES times (codigoTime),
)

INSERT INTO times VALUES
(1, 'Botafogo', 'Ribeir�o Preto', 'Santa Cruz'),
(2, 'Corinthians', 'S�o Paulo', 'Neo Qu�mica Arena'),
(3, 'Ferrovi�ria', 'Araraquara', 'Fonte Luminosa'),
(4, 'Guarani', 'Campinas', 'Brinco de Ouro'),
(5, 'Inter de Limeira', 'Limeira', 'Limeir�o'),
(6, 'Ituano', 'Itu', 'Novelli J�nior'),
(7, 'Mirassol', 'Mirassol', 'Jos� Maria de Campos Maia'),
(8, 'Novorizontino', 'Novo Horizonte', 'Jorge Ismael de Biasi'),
(9, 'Palmeiras', 'S�o Paulo', 'Allianz Parque'),
(10, 'Ponte Preta', 'Campinas', 'Mois�s Lucarelli'),
(11, 'Red Bull Bragantino', 'Bragan�a Paulista', 'Nabi Abi Chedid'),
(12, 'Santo Andr�', 'Santo Andr�', 'Bruno Jos� Daniel'),
(13, 'Santos', 'Santos', 'Vila Belmiro'),
(14, 'S�o Bento', 'Sorocaba', 'Walter Ribeiro'),
(15, 'S�o Caetano', 'S�o Caetano do Sul', 'Anacleto Campanella'),
(16, 'S�o Paulo', 'S�o Paulo', 'Morumbi')
drop procedure sp_divideGrupos
CREATE PROCEDURE sp_divideGrupos

AS
	DECLARE @qtdTimes INT,
			@cont INT,
			@cod_grupo INT
	SET @cont = (SELECT COUNT (*) FROM grupos) + 1
	--Inserindo os cabe�as de chave
	IF @cont = 1
	BEGIN
	INSERT INTO grupos VALUES
	(2,'A'),
	(9,'B'),
	(13,'C'),
	(16,'D')
	END
	SET @qtdTimes = 16
	--Inserindo os outros times no grupo, enquanto a quantidade do contador for igual a quantidade dos times
	WHILE (@cont <= @qtdTimes)
	BEGIN 
	--Gerando id randomico
		SET @cod_grupo = CAST(RAND()*((4 - 1) + 1) + 1 AS INT)
		--Vereficando os n�o exclusivos
		IF @cont != 2 AND @cont != 9 AND @cont != 13 AND @cont != 16
		BEGIN
			--Verifica��o de qual grupo �
			IF @cod_grupo = 1 
			BEGIN
				--Caso for 1 ser� o A e assim por diante at� o D
				IF (SELECT COUNT(*) FROM grupos WHERE letra = 'A') < 4
				BEGIN
					INSERT INTO grupos VALUES (@cont, 'A')
					SET @cont = @cont + 1
					CONTINUE
				END
			END

			IF @cod_grupo = 2 
			BEGIN
				IF (SELECT COUNT(*) FROM grupos WHERE letra = 'B') < 4
				BEGIN
					INSERT INTO grupos VALUES (@cont, 'B')
					SET @cont = @cont + 1
					CONTINUE
				END
			END
			IF @cod_grupo = 3 
				IF (SELECT COUNT(*) FROM grupos WHERE letra = 'C') < 4
				BEGIN
					INSERT INTO grupos VALUES (@cont, 'C')
					SET @cont = @cont + 1
					CONTINUE
				END
			IF @cod_grupo = 4 
			BEGIN
				IF (SELECT COUNT(*) FROM grupos where letra = 'D') < 4
				BEGIN
					INSERT INTO grupos VALUES (@cont, 'D')
					SET @cont = @cont + 1
					CONTINUE
				END
			END
		END
		ELSE
		BEGIN
			SET @cont = @cont + 1
		END 
	END

	EXEC sp_divideGrupos 
	

CREATE VIEW vwGrupos AS
SELECT g.letra AS grupo, t.nomeTime AS participantes, t.cidade, t.estadio, g.codigoTime AS codigo_time
FROM grupos g
LEFT JOIN times t
ON g.codigoTime = t.codigoTime

SELECT * FROM vwGrupos ORDER BY grupo







