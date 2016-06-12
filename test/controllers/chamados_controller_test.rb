require 'test_helper'

class ChamadosControllerTest < ActionController::TestCase
  setup do
    @chamado = chamados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chamados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chamado" do
    assert_difference('Chamado.count') do
      post :create, chamado: { avaliacao_usuario: @chamado.avaliacao_usuario, data_status_aberto: @chamado.data_status_aberto, data_status_concluido: @chamado.data_status_concluido, data_status_em_atendimento: @chamado.data_status_em_atendimento, data_status_fechado: @chamado.data_status_fechado, motivo_cancelamento: @chamado.motivo_cancelamento, nivel_satisfacao_usuario: @chamado.nivel_satisfacao_usuario, observacoes_usuario: @chamado.observacoes_usuario, parecer_final_tecnico: @chamado.parecer_final_tecnico, parecer_preliminar_tecnico: @chamado.parecer_preliminar_tecnico, problema_id: @chamado.problema_id, status: @chamado.status, user_id: @chamado.user_id }
    end

    assert_redirected_to chamado_path(assigns(:chamado))
  end

  test "should show chamado" do
    get :show, id: @chamado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chamado
    assert_response :success
  end

  test "should update chamado" do
    patch :update, id: @chamado, chamado: { avaliacao_usuario: @chamado.avaliacao_usuario, data_status_aberto: @chamado.data_status_aberto, data_status_concluido: @chamado.data_status_concluido, data_status_em_atendimento: @chamado.data_status_em_atendimento, data_status_fechado: @chamado.data_status_fechado, motivo_cancelamento: @chamado.motivo_cancelamento, nivel_satisfacao_usuario: @chamado.nivel_satisfacao_usuario, observacoes_usuario: @chamado.observacoes_usuario, parecer_final_tecnico: @chamado.parecer_final_tecnico, parecer_preliminar_tecnico: @chamado.parecer_preliminar_tecnico, problema_id: @chamado.problema_id, status: @chamado.status, user_id: @chamado.user_id }
    assert_redirected_to chamado_path(assigns(:chamado))
  end

  test "should destroy chamado" do
    assert_difference('Chamado.count', -1) do
      delete :destroy, id: @chamado
    end

    assert_redirected_to chamados_path
  end
end
