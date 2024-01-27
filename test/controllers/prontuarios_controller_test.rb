require "test_helper"

class ProntuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prontuario = prontuarios(:one)
  end

  test "should get index" do
    get prontuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_prontuario_url
    assert_response :success
  end

  test "should create prontuario" do
    assert_difference("Prontuario.count") do
      post prontuarios_url, params: { prontuario: { codigo: @prontuario.codigo, dataCriacao: @prontuario.dataCriacao, historico: @prontuario.historico } }
    end

    assert_redirected_to prontuario_url(Prontuario.last)
  end

  test "should show prontuario" do
    get prontuario_url(@prontuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_prontuario_url(@prontuario)
    assert_response :success
  end

  test "should update prontuario" do
    patch prontuario_url(@prontuario), params: { prontuario: { codigo: @prontuario.codigo, dataCriacao: @prontuario.dataCriacao, historico: @prontuario.historico } }
    assert_redirected_to prontuario_url(@prontuario)
  end

  test "should destroy prontuario" do
    assert_difference("Prontuario.count", -1) do
      delete prontuario_url(@prontuario)
    end

    assert_redirected_to prontuarios_url
  end
end
