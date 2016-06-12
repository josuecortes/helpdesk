json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id, :nome, :sigla, :email, :telefone
  json.url departamento_url(departamento, format: :json)
end
