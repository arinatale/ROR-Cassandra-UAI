class Aula

    include Cequel::Record
  
    key :id, :timeuuid, auto: true
    column :numero, :int
    column :piso, :int
    column :capacidad, :int
    column :asignado, :boolean
  
    timestamps

end