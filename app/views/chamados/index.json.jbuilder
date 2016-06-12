json.array!(@chamados) do |chamado|
  json.extract! chamado, :id, :problema_id, :observacoes_usuario, :user_id, :status, :data_status_aberto, :data_status_fechado, :data_status_em_atendimento, :data_status_concluido, :parecer_preliminar_tecnico, :parecer_final_tecnico, :motivo_cancelamento, :avaliacao_usuario, :nivel_satisfacao_usuario
  json.url chamado_url(chamado, format: :json)
end
