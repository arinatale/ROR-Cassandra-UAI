# UNIVERSIDAD ABIERTA INTERAMERICANA
# PROGRAMACIÓN WEB AVANZADA

#RUBY ON RAILS CON CASSANDRA

Grupo Nº5:
Erika Peyrade
Mariela de la Torre
Héctor Martinotti
Ariel Natale
Solana Vidal
Leda Varela

Docente:
Matías Teragni

Introducción
Con el propósito de desarrollar el Trabajo Práctico de la Materia, nos fue asignado el uso de tecnología Ruby on rails vinculando los datos con una base noSQL Cassandra a fin de desarrollar un software que administre aulas y cursos de un establecimiento educativo, alertando los casos de incompatibilidad (más cursos que aulas disponibles). En las siguientes líneas se detallarán brevemente los puntos más destacados de la experiencia obtenida tanto en la instalación del framework, como en la configuración del ide y los aspectos propios del desarrollo y pruebas. 

Descripción del alcance
Intervenir en el aprendizaje de tecnologías poco frecuentes, basados en desarrollo web con persistencia en una estructura de datos no relacional. Ninguno de los miembros del equipo tenía experiencia previa sobre el lenguaje Ruby ni tampoco sobre CQL, lo que implicó iniciar desde cero el proceso, basándonos en información obtenida de la comunidad de desarrolladores Ruby que se encuentra disponible en Internet. A partir de la consigna asignada, lograr una evaluación de uso de la tecnología Ruby on Rails para el desarrollo de una aplicación web de carácter general.

Desarrollo del trabajo
Primero, se procedió a la instalación de el lenguaje de programación RubyRuby, con el framework Rails para aplicaciones web, para ello fue necesario bajar el paquete desarrollador Ruby Installer + Dev Kit que se encuentra disponible en la página https://rubyinstaller.org/

Luego iniciamos el proceso de instalación que cargó Ruby en su versión 2.2.6 y la base SQLite3, llegado este punto fue necesario incorporar las gemas de Rails mediante el comando: 

gem install rails

Para crear la aplicación se utiliza el generador new asociado al nombre del proyecto en el cmd de Ruby, esto inicia una serie de acciones que crea varios archivos autogenerados y carpetas que conforman la estructura de la aplicación Rails (modelos, vistas y controllers).

Para trabajar en el desarrollo de la aplicación, hemos probado varios editores de texto, pero el más cómodo resultó ser Visual Studio Code, al que se configuró para Ruby, incluyendo el repositorio GitHub https://github.com/marudlt/AppRuby:

Con respecto a la base de datos, por defecto, rails emplea SQLite3, a los efectos de iniciar las tareas de programación de nuestra aplicación se planteó la posibilidad de utilizarla hasta tanto se finalizaran las tareas de investigación sobre Cassandra, que luego migraríamos. Es de destacar que se verificó preliminarmente su compatibilidad.

Luego de implementar el código, nos encontramos con la dificil tarea de cambiar la base de datos SQLite3 a Cassandra, a lo que tuvimos que armar otro repositorio para iniciar las configuraciones pertinentes a la conexión, es por eso que tenemos dos proyectos GitHub:

El primero es el que tiene la base de datos Sqlite3: https://github.com/marudlt/AppRuby y el que ahora estas leyendo, es la migración con cambio de código para que funcione con Cassandra.

Instalamos el apache Cassandra, descargando los siguientes componentes:

Java SE Runtime Environment Downloads: https://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html

Cassandra apache: http://cassandra.apache.org/download/

Apache Thrift: https://thrift.apache.org/download

Python 2.7.X: https://www.python.org/downloads/

Una vez levantada la base de datos, por medio del comando cassandra.bat -f, instalamos las gemas "cequel" y "cassandra-adapter" a nuestro framework para realizar las conexiones a la base de datos nueva.

Tambien instalamos la aplicación DevCenter para chequear la información que se iba cargando a la base de datos, para verificar que realmente se esten grabando los datos en Cassandra.

Luego de lidiar con varias imcompatibilidades de gemas, encontramos conveniente instalar lo siguiente:

source 'https://rubygems.org'
gem 'cequel', '~> 3.2', '>= 3.2.1'
gem 'cassandra-driver', '~> 3.2', '>= 3.2.3'

y autogeneramos la configuración de la base con el comando "rails g cequel:configuration" y la generación de la instancia: "rake cequel:keyspace:create".

Se generaron los modelos (clases) "Aulas" y "Cursos" mas la página principal "Welcome" y confirmamos el squema con el comando "rake cequel:migrate"

Si bien, no es dificil programar y manipular la base de datos, nos llevó muchisimo tiempo "googlear" las formas de programación para un lenguaje que no conocemos, y la manipulación de datos de la base, y tuvimos que cambiar mucho código para que funcione lo que habiamos hecho con Sqlite3, pero finalmente lo logramos.

La aplicación genera una planificación de los cursos cargados en las aulas que generamos, dando por prioridad al piso 7 solo a los cursos de la carrera Ingeniería en Sistemas. Si existiesen mas cursos de la carrera, se agregarán a las otras aulas generadas, siempre respetando el orden de cursos con mayores alumnos, a menor cantidad, al igual que las aulas, estan ordenadas para asignación, de mayor capadidad a menor capacidad. Por ultimo, si hay cursos que no pueden ser ubicados por capacidad y falta de aulas, se listará al final de la planificación.


