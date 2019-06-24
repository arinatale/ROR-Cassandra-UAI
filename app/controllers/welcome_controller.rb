class WelcomeController < ApplicationController
  def index
    @tutor='El grupo de Ruby On Rails'
 

  @cursoscargados=Curso.connection.execute('select count(*) from cursos;').first['count']

    @aulascargadas=Aula.connection.execute('select count(*) from aulas;').first['count']


@dias=["Lunes","Martes","Miecoles","Jueves","Viernes"]

  end
end
