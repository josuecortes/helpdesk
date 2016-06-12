json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :departamento_id, :quantidade, :estado, :observacoes
  json.url inventario_url(inventario, format: :json)
end
