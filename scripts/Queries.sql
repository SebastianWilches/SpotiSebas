--  INSERT
--Artista
INSERT INTO artista (idArtista, nameArtista, pais, dateFormacion, descripcion)
VALUES
    (1, 'Gustavo Cerati', 'Argentina', '1959-08-11', 'Gustavo Adrián Cerati, conocido como Gustavo Cerati, fue un músico, cantautor y productor discográfico argentino'),
    (2, 'The Beatles', 'Inglaterra', '1960-01-01', 'The Beatles, más conocido en el mundo hispano como los Beatles, fue un grupo de rock británico formado en Liverpool durante los años 1960'),
    (3, 'John Frusciante', 'Estados Unidos', '1970-03-05', 'John Anthony Frusciante es un músico estadounidense y guitarrista de los Red Hot Chili Peppers'),
    (4, 'Radiohead', 'Inglaterra', '1985-01-01', 'Radiohead es una banda británica de rock alternativo originaria de Abingdon-on-Thames, Inglaterra, formada en 1985 inicialmente como una banda de versiones'),
    (5, 'Twenty One Pilots', 'Estados Unidos', '2009-01-01', 'Twenty One Pilots es un dúo musical estadounidense de Columbus, Ohio. La banda se formó en 2009 por el vocalista Tyler Joseph junto con Nick Thomas y Chris Salih, quienes la abandonaron en 2011');
--Cancion
INSERT INTO cancion (idCancion, idArtista, nameCancion, nameAlbum, genero, duracion, formato)
VALUES
    (1, 1, 'Crimen', 'Ahí Vamos', 'Rock', 285, 'MP3'),
    (2, 1, 'Cactus', 'Fuerza Natural', 'Rock', 320, 'MP3'),
    (3, 2, 'Hey Jude', 'The Beatles (White Album)', 'Rock', 421, 'FLAC'),
    (4, 2, 'Let It Be', 'Let It Be', 'Rock', 243, 'FLAC'),
    (5, 3, 'The First Season', 'To Record Only Water For Ten Days', 'Rock', 215, 'MP3'),
    (6, 3, 'Anne', 'Curtains', 'Rock', 255, 'MP3'),
    (7, 4, 'Videotape', 'In Rainbows', 'Rock', 237, 'MP3'),
    (8, 4, 'Paranoid Android', 'OK Computer', 'Rock', 386, 'WAV');
--Usuario
INSERT INTO usuario (idUsuario, nombresUsuario, apellidosUsuario, email, telefono, pais)
VALUES
    (1, 'Juan', 'Perez', 'juan.perez@example.com', 123456789, 'Argentina'),
    (2, 'María', 'González', 'maria.gonzalez@example.com', 987654321, 'España'),
    (3, 'Sebastian', 'Wilches', 'sebastian.wilches@example.com', 456789123, 'Colombia'),
    (4, 'Ana', 'Martínez', 'ana.martinez@example.com', 789123456, 'Colombia'),
    (5, 'Pedro', 'Rodríguez', 'pedro.rodriguez@example.com', 321654987, 'Chile');
--Playlist
INSERT INTO playlist (idPlaylist, idCancion, idUsuario, namePlaylist)
VALUES
    (1, 1, 1, 'Temas Cerati'),
    (1, 2, 1, 'Temas Cerati'),
    (2, 3, 2, 'Canciones Beatles'),
    (2, 4, 2, 'Canciones Beatles'),
    (3, 5, 2, 'Frusciantesongs'),
    (3, 6, 2, 'Frusciantesongs'),
    (4, 1, 3, 'Mix de todo'),
    (4, 2, 3, 'Mix de todo'),
    (4, 3, 3, 'Mix de todo'),
    (4, 4, 3, 'Mix de todo'),
    (4, 5, 3, 'Mix de todo'),
    (4, 6, 3, 'Mix de todo'),
    (4, 7, 3, 'Mix de todo'),
    (4, 8, 3, 'Mix de todo'),
    (5, 1, 4, 'Variado'),
    (5, 2, 4, 'Variado'),
    (5, 3, 4, 'Variado');


--  SELECT
-- Consultar todas las canciones disponibles de los artistas
SELECT c.idCancion, c.nameCancion, a.nameArtista
FROM cancion c
INNER JOIN artista a ON c.idArtista = a.idArtista;

-- Contar cuantas canciones tiene cada artista
SELECT a.idArtista, a.nameArtista, COUNT(c.idCancion) AS totalCanciones
FROM artista a
LEFT JOIN cancion c ON a.idArtista = c.idArtista
GROUP BY a.idArtista, a.nameArtista
ORDER BY totalCanciones DESC;

--Consulta que clasifica las canciones de la base de datos en 'Larga', 'Media' o 'Corta' según su duración en segundos
SELECT idCancion, nameCancion,
    CASE
        WHEN duracion > 300 THEN 'Larga'
        WHEN duracion > 180 THEN 'Media'
        ELSE 'Corta'
    END AS duracionCategoria
FROM cancion;

--Consulta que hace una fusión de dos playlist distintas y quita las canciones repetidas
SELECT DISTINCT c.idcancion, c.namecancion , c.namealbum, c.duracion, c.formato  
FROM cancion c
INNER JOIN playlist p ON c.idcancion = p.idcancion
WHERE p.idplaylist = 1
UNION 
SELECT DISTINCT c.idcancion, c.namecancion , c.namealbum, c.duracion, c.formato  
FROM cancion c
INNER JOIN playlist p ON c.idcancion = p.idcancion
WHERE p.idplaylist = 5;


--  UPDATE
-- Actualizar la duración de la canción numero 1
UPDATE cancion c SET c.duracion = 300 WHERE c.idCancion = 1;
select * from cancion c; 


--  DELETE   
-- Quitar de una playlist especifica una canción
DELETE FROM playlist WHERE idPlaylist=1 and idCancion=1 and  idUsuario=1;  
select * from playlist p;