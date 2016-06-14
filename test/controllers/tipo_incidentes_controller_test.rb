require 'test_helper'

class TipoIncidentesControllerTest < ActionController::TestCase
  setup do
    @tipo_incidente = tipo_incidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_incidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_incidente" do
    assert_difference('TipoIncidente.count') do
      post :create, tipo_incidente: { descricao: @tipo_incidente.descricao }
    end

    assert_redirected_to tipo_incidente_path(assigns(:tipo_incidente))
  end

  test "should show tipo_incidente" do
    get :show, id: @tipo_incidente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_incidente
    assert_response :success
  end

  test "should update tipo_incidente" do
    patch :update, id: @tipo_incidente, tipo_incidente: { descricao: @tipo_incidente.descricao }
    assert_redirected_to tipo_incidente_path(assigns(:tipo_incidente))
  end

  test "should destroy tipo_incidente" do
    assert_difference('TipoIncidente.count', -1) do
      delete :destroy, id: @tipo_incidente
    end

    assert_redirected_to tipo_incidentes_path
  end
end
