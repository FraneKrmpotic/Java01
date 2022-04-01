CREATE DATABASE Java01
GO
USE Java01
GO


------------------------------------
--GENRES------------------------------
CREATE TABLE Genres
(
	IDGenres INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(300),
)
GO

--CREATE---------------------
CREATE PROCEDURE createGenre
	@Name NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Genres VALUES(@Name)
	SET @Id = SCOPE_IDENTITY()
END
GO

--UPDATE----------------------
CREATE PROCEDURE updateGenre
	@Name NVARCHAR(300),
	@IDGenre int
	 
AS 
BEGIN 
	UPDATE Genres SET 
		Name = @Name
	WHERE 
		IDGenres = @IDGenre
END
GO

--DELETE--------------------
CREATE PROCEDURE deleteGenre
	@IDGenre INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Genres
	WHERE 
		IDGenres = @IDGenre
END
GO

--SELECT---------------------
CREATE PROCEDURE selectGenre
	@IDGenre INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Genres
	WHERE 
		IDGenres = @IDGenre
END
GO


--SELECT ALL--------------------
ALTER PROCEDURE selectGenres
AS 
BEGIN 
	SELECT DISTINCT * FROM Genres
END
GO

--------------------------------------
--PERSONS-----------------------------
CREATE TABLE Persons
(
	IDPerson INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(300),
	LastName NVARCHAR(300)
)
GO

--CREATE---------------------
CREATE PROCEDURE createPerson
	@FirstName NVARCHAR(300),
	@LastName NVARCHAR(300),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Persons VALUES(@FirstName, @LastName)
	SET @Id = SCOPE_IDENTITY()
END
GO

--UPDATE----------------------
CREATE PROCEDURE updatePerson
	@FirstName NVARCHAR(300),
	@LastName NVARCHAR(300),
	@IDPerson int
	 
AS 
BEGIN 
	UPDATE Persons SET 
		FirstName = @FirstName,
		LastName = @LastName
	WHERE 
		IDPerson = @IDPerson
END
GO

--DELETE--------------------
CREATE PROCEDURE deletePerson
	@IDPerson INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Persons
	WHERE 
		IDPerson = @IDPerson
END
GO

--SELECT---------------------
CREATE PROCEDURE selectPerson
	@IDPerson INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Persons
	WHERE 
		IDPerson = @IDPerson
END
GO


--SELECT ALL--------------------
CREATE PROCEDURE selectPersons
AS 
BEGIN 
	SELECT * FROM Persons
END
GO

drop table MovieAndPersons
drop table Movies
------------------------------------
--MOVIES----------------------------
CREATE TABLE Movies
(
	IDMovie INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(300),
	PublishedDate NVARCHAR(90),
	Description NVARCHAR(900),
	Name NVARCHAR(300),
	--DirectorID int FOREIGN KEY REFERENCES Persons(IDPerson),
	Director NVARCHAR(300),
	Actors NVARCHAR(900),
	Duration int,
	Genre NVARCHAR(300),
	Picture NVARCHAR(900)
)
GO

--CREATE---------------------
ALTER PROCEDURE createMovie
	@Title NVARCHAR(300),
	@PublishedDate NVARCHAR(90),
	@Description NVARCHAR(900),
	@Name NVARCHAR(300),
	@Director NVARCHAR(300),
	@Actors NVARCHAR(900),
	@Duration int,
	@Genre NVARCHAR(300),
	@Picture NVARCHAR(900),
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO Movies VALUES(@Title, @PublishedDate, @Description, @Name, @Director, @Actors, @Duration, @Genre, @Picture)
	SET @Id = SCOPE_IDENTITY()
END
GO

--UPDATE----------------------
ALTER PROCEDURE updateMovie
	@Title NVARCHAR(300),
	@PublishedDate NVARCHAR(90),
	@Description NVARCHAR(900),
	@Name NVARCHAR(300),
	@Director NVARCHAR(300),
	@Actors NVARCHAR(900),
	@Duration int,
	@Genre NVARCHAR(300),
	@Picture NVARCHAR(900),
	@IDMovie int
	 
AS 
BEGIN 
	UPDATE Movies SET 
		Title = @Title,
		PublishedDate = @PublishedDate,
		Description = @Description,
		Name = @Name,
		Director = @Director,
		Actors = @Actors,
		Duration = @Duration,
		Genre = @Genre,
		Picture = @Picture
	WHERE 
		IDMovie = @IDMovie
END
GO

--DELETE--------------------
CREATE PROCEDURE deleteMovie
	@IDMovie INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			Movies
	WHERE 
		IDMovie = @IDMovie
END
GO

--DELETE ALL------------------
CREATE PROCEDURE deleteAllMovies	 
AS 
BEGIN 
	DELETE  
	FROM 
			Movies
END
GO

--SELECT---------------------
CREATE PROCEDURE selectMovie
	@IDMovie INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Movies
	WHERE 
		IDMovie = @IDMovie
END
GO


--SELECT ALL--------------------
CREATE PROCEDURE selectMovies
AS 
BEGIN 
	SELECT * FROM Movies
END
GO

--------------------------------------------------------
--MOVIE AND PERSONS-------------------------------------
CREATE TABLE MovieAndPersons
(
	IDMovieAndPerson INT PRIMARY KEY IDENTITY,
	MovieID int FOREIGN KEY REFERENCES Movies(IDMovie),
	PersonID int FOREIGN KEY REFERENCES Persons(IDPerson)

)
GO

--CREATE---------------------
CREATE PROCEDURE createMovieAndPersons
	@MovieID int,
	@PersonID int,
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO MovieAndPersons VALUES(@MovieID, @PersonID)
	SET @Id = SCOPE_IDENTITY()
END
GO

--UPDATE----------------------
CREATE PROCEDURE updateMovieAndPersons
	@MovieID int,
	@PersonID int,
	@IDMovieAndPerson int
	 
AS 
BEGIN 
	UPDATE MovieAndPersons SET 
		MovieID = @MovieID,
		PersonID = @PersonID
	WHERE 
		IDMovieAndPerson = @IDMovieAndPerson
END
GO

--DELETE--------------------
CREATE PROCEDURE deleteMovieAndPerson
	@IDMovieAndPerson INT	 
AS 
BEGIN 
	DELETE  
	FROM 
			MovieAndPersons
	WHERE 
		IDMovieAndPerson = @IDMovieAndPerson
END
GO

--DELETE ALL------------------
CREATE PROCEDURE deleteAllMoviesAndPersons	 
AS 
BEGIN 
	DELETE  
	FROM 
			MovieAndPersons
END
GO

--SELECT---------------------
CREATE PROCEDURE selectMovieAndPerson
	@IDMovieAndPerson INT
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		MovieAndPersons
	WHERE 
		IDMovieAndPerson = @IDMovieAndPerson
END
GO


--SELECT ALL--------------------
CREATE PROCEDURE selectMoviesAndPersons
AS 
BEGIN 
	SELECT * FROM MovieAndPersons
END
GO

---------------------------------------------
--MOVIES AND GENRES--------------------------
--CREATE TABLE MovieAndGenres
--(
--	IDMovieAndGenre INT PRIMARY KEY IDENTITY,
--	MovieID int FOREIGN KEY REFERENCES Movies(IDMovie),
--	GenreID int FOREIGN KEY REFERENCES Genres(IDGenres)

--)
--GO

----CREATE---------------------
--CREATE PROCEDURE createMovieAndGenre
--	@MovieID int,
--	@GenreID int,
--	@Id INT OUTPUT
--AS 
--BEGIN 
--	INSERT INTO MovieAndGenres VALUES(@MovieID, @GenreID)
--	SET @Id = SCOPE_IDENTITY()
--END
--GO

----UPDATE----------------------
--CREATE PROCEDURE updateMovieAndGenre
--	@MovieID int,
--	@GenreID int,
--	@IDMovieAndGenre int
	 
--AS 
--BEGIN 
--	UPDATE MovieAndGenres SET 
--		MovieID = @MovieID,
--		GenreID = @GenreID
--	WHERE 
--		IDMovieAndGenre = @IDMovieAndGenre
--END
--GO

----DELETE--------------------
--CREATE PROCEDURE deleteMovieAndGenre
--	@IDMovieAndGenre INT	 
--AS 
--BEGIN 
--	DELETE  
--	FROM 
--			MovieAndGenres
--	WHERE 
--		IDMovieAndGenre = @IDMovieAndGenre
--END
--GO

----DELETE ALL------------------
--CREATE PROCEDURE deleteAllMoviesAndGenres 
--AS 
--BEGIN 
--	DELETE  
--	FROM 
--			MovieAndGenres
--END
--GO

----SELECT---------------------
--CREATE PROCEDURE selectMovieAndGenre
--	@IDMovieAndGenre INT
--AS 
--BEGIN 
--	SELECT 
--		* 
--	FROM 
--		MovieAndGenres
--	WHERE 
--		IDMovieAndGenre = @IDMovieAndGenre
--END
--GO


----SELECT ALL--------------------
--CREATE PROCEDURE selectMoviesAndGenres
--AS 
--BEGIN 
--	SELECT * FROM MovieAndGenres
--END
--GO


--------------------------------------
--USER ACC----------------------------
CREATE TABLE UserAcc
(
	IDUser INT PRIMARY KEY IDENTITY,
	Username NVARCHAR(300),
	Password NVARCHAR(300),
	Admin BIT
)
GO

--CREATE---------------------
CREATE PROCEDURE createUser
	@Username NVARCHAR(300),
	@Password NVARCHAR(300),
	@Admin BIT,
	@Id INT OUTPUT
AS 
BEGIN 
	INSERT INTO UserAcc VALUES(@Username, @Password, @Admin)
	SET @Id = SCOPE_IDENTITY()
END
GO

--SELECT---------------------
ALTER PROCEDURE selectUser
	@Username NVARCHAR(300)
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		UserAcc
	WHERE 
		Username = @Username
END
GO

--KREIRAJ ADMINA--------------------
------------------------------------

INSERT INTO UserAcc (Username, Password, Admin)
VALUES ('admin', 'admin', 1)
