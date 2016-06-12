require 'test_helper'

class ProblemasControllerTest < ActionController::TestCase
  setup do
    @problema = problemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problema" do
    assert_difference('Problema.count') do
      post :create, problema: { descricao: @problema.descricao, solucao: @problema.solucao, tipo: @problema.tipo }
    end

    assert_redirected_to problema_path(assigns(:problema))
  end

  test "should show problema" do
    get :show, id: @problema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problema
    assert_response :success
  end

  test "should update problema" do
    patch :update, id: @problema, problema: { descricao: @problema.descricao, solucao: @problema.solucao, tipo: @problema.tipo }
    assert_redirected_to problema_path(assigns(:problema))
  end

  test "should destroy problema" do
    assert_difference('Problema.count', -1) do
      delete :destroy, id: @problema
    end

    assert_redirected_to problemas_path
  end
end
