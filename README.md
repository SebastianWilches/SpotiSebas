# SpotiSebas (Prueba Técnica de Ingreso Desarrollador para TBTB Global - Parte I y II)
<p align="center" style="padding: 20px; background: #252832">
    <img src="https://github.com/SebastianWilches/SpotiSebas/blob/main/img/Header.png" alt="Header">
</p>

## Descripción
Este repositorio contiene el backend para un sistema de software diseñado para modelar y gestionar la funcionalidad de un servicio de música en línea, similar a Spotify. El proyecto abarca el modelo de artistas, canciones, usuarios y playlists, permitiendo a los usuarios descubrir y organizar su música favorita de manera eficiente en playlists.

## Parte I
Dentro de la carpeta de **Scripts**, en el archivo **InitialScript.sql** se encuentra el modelo de la BD hecho en Postgresql en la que encontraran las tablas de 'artista, cancion, usuario y playlist'. Para el modelo se consideraron las siguientes reglas:

- Un artista puede tener registrado a su nombre una o muchas canciones.
- Una canción puede estar asociada a uno o muchos usuarios.
- Un usuario puede guardar una o muchas canciones.
- La tabla de rompimiento que se produce entre canción y usuario pasara a ser conocida como playlist.

Además, se tienen las siguientes consideraciones para algunos campos:
- Dentro de la tabla de artista se tiene como campo único el nombre, para evitar tener dos artistas compartiendo el mismo nombre. 
- Dentro de la tabla de canción se tiene como campo único el nombre de la canción y el nombre del álbum, para evitar duplicados del mismo nombre de canción en el mismo álbum.
- Dentro de la tabla de usuario se tiene como campo único el email, para evitar tener dos usuarios registrados con el mismo email.
- Dentro de la tabla playlist se tiene que el valor por default del campo fechaCreacion sea la fecha asociada en sistema. 

Dentro de la carpeta de **Scripts**, en el archivo **InitialScript.sql** se encuentra la inserción de unos registros de prueba y las queries para consultar, actualizar y borrar registros. Las queries de consulta permiten hacer lo siguiente:
- Consultar todas las canciones disponibles de los artistas.
- Contar cuantas canciones tiene cada artista.
- Clasificar las canciones de la base de datos en 'Larga', 'Media' o 'Corta' según su duración en segundos.
- Fusionar dos playlist distintas y quitar las canciones repetidas.

El diagrama entidad relación es el siguiente:
<p align="center" style="padding: 20px; background: #252832">
    <img src="https://github.com/SebastianWilches/SpotiSebas/blob/main/scripts/DiagramaER.png" alt="DiagramaER">
</p>

El diagrama físico es el siguiente:
<p align="center" style="padding: 20px; background: #252832">
    <img src="https://github.com/SebastianWilches/SpotiSebas/blob/main/scripts/DiagramaFisico.png" alt="DiagramaFisico">
</p>

## Parte II
Para la creación de la RESTful API se hará uso de las siguientes recursos:
| Paquete | Versión |
| ------ | ------ |
| cors | 2.8.5 |
| dotenv | 16.4.5 |
| express | 4.19.2 |
| pg | 8.12.0 |

### Documentación 📕
La documentación de los 5 endpoints generados para la tabla Artistas puede ser encontrada [**aquí**](https://documenter.getpostman.com/view/20804832/2sA3XWdJjU).

### Instalación
> **NOTA:** Se instalar Postgresql previamente y cargar el InitialScript.sql y Queries.sql en la base de datos de Postgresql teniendo en cuenta la plantilla de las variables de entorno.

Descargue el repositorio del proyecto en su directorio local:
```
git clone https://github.com/SebastianWilches/SpotiSebas.git
```
Abra la carpeta **SpotiSebas** con Visual Studio Code, y con su terminal integrada, ejecute:
```
npm i
```
Para abrir el proyecto en modo de desarrollo, ejecute en la terminal:
```
npm start
```

> **NOTA:** El archivo que contiene las variables de entorno .env se encuentra en la carpeta raiz de **SpotiSebas** se sube para facilitar la ejecución rapida de la prueba técnica, esta se debe modificar en Visual Studio Code según las credenciales en las que se vaya a correr la BD local.
## Parte III
El desarrollo del aplicativo web puede ser encontrado [**aquí**](https://github.com/SebastianWilches/TBTB_Global-Parte3).