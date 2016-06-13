json.array!(@incidentes) do |incidente|
  json.extract! incidente, :id, :descricao, :data_inicio, :data_fim, :previsao_fim, :status, :observacoes, :tipo_incidente_id
  json.url incidente_url(incidente, format: :json)
end
