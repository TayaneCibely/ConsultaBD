require "test_helper"

class ExamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exame = exames(:one)
  end

  test "should get index" do
    get exames_url
    assert_response :success
  end

  test "should get new" do
    get new_exame_url
    assert_response :success
  end

  test "should create exame" do
    assert_difference("Exame.count") do
      post exames_url, params: { exame: { cod: @exame.cod, data: @exame.data, descricao: @exame.descricao, nomeExame: @exame.nomeExame, resultado: @exame.resultado } }
    end

    assert_redirected_to exame_url(Exame.last)
  end

  test "should show exame" do
    get exame_url(@exame)
    assert_response :success
  end

  test "should get edit" do
    get edit_exame_url(@exame)
    assert_response :success
  end

  test "should update exame" do
    patch exame_url(@exame), params: { exame: { cod: @exame.cod, data: @exame.data, descricao: @exame.descricao, nomeExame: @exame.nomeExame, resultado: @exame.resultado } }
    assert_redirected_to exame_url(@exame)
  end

  test "should destroy exame" do
    assert_difference("Exame.count", -1) do
      delete exame_url(@exame)
    end

    assert_redirected_to exames_url
  end
end
