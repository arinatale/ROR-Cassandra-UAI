class Curso 

include Cequel::Record
  
    key :id, :timeuuid, auto: true
    column :nombre, :text
    column :carrera, :text
    column :cantidadalumnos, :int
    column :turno, :text
    column :comision, :text
    column :asignado, :boolean
  
    timestamps

CLASS_LIST_TURNO= ["Mañana", "Tarde", "Noche"]
CLASS_LIST_COMISION=["1A","1B","1K","2A","2B","3A","3B","3K","4A","4B","4K"]
CLASS_LIST_CARRERA=["Lic. en Informática","Ing. en Sistemas"]

end
