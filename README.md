# mysql-estructura
Tasca S2.01. Estructura de dades - MySQL

Cada exercici intenta modelar una base de dades. Es lliuren per a cada exercici una imatge .png del diagrama de relació d'entitats així com l'script .sql de creació de la base de dades així com el de càrrega de dades de mostra (loaddata).
Per al nivell 1, també s'afegeix una captura de pantalla de les proves suggerides que confirmen el bon funcionament de la base de dades.

Nivell 1

Exercici 1: Optics_model

Aquest model representa el negoci d'una òptica, i les seves relacions amb els seus clients, proveïdors.
La gran majoria dels camps de les taules tenen la clàusula NOT NULL. S'han deixat uns quants sense aquesta marca perquè es poden considerar opcionals, com el fax o l'email, o informació sobre l'adreça que poden no existir en algun tipus de vivenda o oficina (pis, porta, ...).

Exercici 2: pizzeria_model

Aquest model serveix de base a una web de venda de menjar per Internet d'una pizzeria. Relaciona les comandes de productes (pizzes, hamburgueses i begudes), amb els clients, la botiga on s'ha dut a terme la venda i el personal de la botiga.

Nivell 2

Exercici 1: You Tube model

Aquest model és una versió simplificada de la coneguda aplicació de visualització de videos.
Relaciona els usuaris, els videos que penjen, els comentaris i valoracions que fan dels videos i dels comentaris de tercers. També permet gestionar canals d'usuari, playlists.

---------------------------------------------------------------------
Requisits tècnics

Els diagrames i scripts s'han generat a partir del MySQL Workbench, versió 8.0.38 Community. Es pot descarregar des del vincle https://dev.mysql.com/downloads/installer/, seleccionant sistema operatiu i versió.

Instal·lació: 
1. Clonar el repositorio de Github
git clone https://github.com/g-lemoing/mysql-estructura.git
2. Abrir el MySql WorkBench y crear desde cero la base de datos:
- ir a File > Import > Reverse Engineer MySQL Create script...
- en Select SQL Script File: buscar el script que lleva el nombre del modelo con la extensión .sql (marcar la casilla "Place import objects on a diagram") y pulsar "Execute".
- en el tab "Physical schemas" aparecen todas las tablas, y se abre también una pestaña del EER diagram con las relaciones entre tablas. 
- En el tab de la instancia local, abrir File > Open SQL Script... y buscar el fichero acabado con _loaddata.sql para ejectuar todos los inserts y cargar la base de datos de muestra.
- 

Contribuciones:
1. Crear un fork del repositorio: 
2. Clonar el repositorio hacia el directorio local marcado por git bash
 git clone https://github.com/YOUR-USERNAME/mysql-estructura.git
3. Crear una rama
git branch BRANCH-NAME
git checkout BRANCH-NAME
4. Realizar cambios o comentarios, y hacer un commit: git commit -m 'mensaje cambios'
5. Subir cambios a tu nueva rama: git push origin BRANCH-NAME
6. Hacer un pull request
