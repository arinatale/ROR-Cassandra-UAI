json.extract! curso, :id, :nombre, :carrera, :cantidadalumnos, :turno, :comision, :asignado, :created_at, :updated_at
json.url curso_url(curso, format: :json)
