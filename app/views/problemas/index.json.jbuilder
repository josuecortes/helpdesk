json.array!(@problemas) do |problema|
  json.extract! problema, :id, :descricao, :solucao, :tipo
  json.url problema_url(problema, format: :json)
end
