--                                              Definición de tablas
CREATE TABLE artista
(
    idArtista INT NOT NULL,
    nameArtista VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    dateFormacion date NOT NULL,
    descripcion VARCHAR(200),

    CONSTRAINT pkArtista PRIMARY KEY (idArtista),
    CONSTRAINT uniquenameArtista UNIQUE (nameArtista) --Evitar tener dos artistas con el mismo nombre
);

CREATE TABLE cancion
(
    idCancion INT NOT NULL,
    idArtista INT NOT NULL, --FK
    nameCancion VARCHAR(200) NOT NULL,
    nameAlbum VARCHAR(200) NOT NULL,
    genero VARCHAR(200) NOT NULL,
    duracion INT NOT NULL,
    formato VARCHAR(200) NOT NULL,

    CONSTRAINT pkCancion PRIMARY KEY (idCancion),
    CONSTRAINT uniqueCancionAlbum UNIQUE (nameCancion, nameAlbum) --Evitar duplicados del mismo nombre de canción en el mismo álbum
);

CREATE TABLE usuario
(
    idUsuario INT NOT NULL,
    nombresUsuario VARCHAR(80) NOT NULL,
    apellidosUsuario VARCHAR(80) NOT NULL,
    email VARCHAR(80) NOT NULL,
    telefono INT NOT NULL,
    pais VARCHAR(60) NOT NULL,

    CONSTRAINT pkUsuario PRIMARY KEY (idUsuario),
    CONSTRAINT uniqueEmail UNIQUE (email) --Evitar que varios usuarios tengan el mismo email
);

-- Tabla de rompimiento Usuario <-> Canciones
CREATE TABLE playlist
(
    idPlaylist INT NOT NULL,
    idCancion INT NOT NULL, --FK
    idUsuario INT NOT NULL, --FK
    namePlaylist VARCHAR(50) NOT NULL,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pkPlaylist PRIMARY KEY (idPlaylist, idCancion, idUsuario)
);

--                                              Constraint de llaves foraneas
--Tabla Cancion
ALTER TABLE cancion ADD CONSTRAINT fkArtista
    FOREIGN KEY (idArtista) REFERENCES artista (idArtista) ON DELETE NO ACTION ON UPDATE NO ACTION;

--Tabla rompimiento playlist
ALTER TABLE playlist ADD CONSTRAINT fkCancion_Playlist
    FOREIGN KEY (idCancion) REFERENCES cancion (idCancion) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE playlist ADD CONSTRAINT fkUsuario_Playlist
    FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario) ON DELETE NO ACTION ON UPDATE NO ACTION;