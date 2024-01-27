require "test_helper"

class PrescricaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescricao = prescricaos(:one)
  end

  test "should get index" do
    get prescricaos_url
    assert_response :success
  end

  test "should get new" do
    get new_prescricao_url
    assert_response :success
  end

  test "should create prescricao" do
    assert_difference("Prescricao.count") do
      post prescricaos_url, params: { prescricao: { cod: @prescricao.cod, data: @prescricao.data, dosagem: @prescricao.dosagem, listaMedicamentos: @prescricao.listaMedicamentos, observacoes: @prescricao.observacoes } }
    end

    assert_redirected_to prescricao_url(Prescricao.last)
  end

  test "should show prescricao" do
    get prescricao_url(@prescricao)
    assert_response :success
  end

  test "should get edit" do
    get edit_prescricao_url(@prescricao)
    assert_response :success
  end

  test "should update prescricao" do
    patch prescricao_url(@prescricao), params: { prescricao: { cod: @prescricao.cod, data: @prescricao.data, dosagem: @prescricao.dosagem, listaMedicamentos: @prescricao.listaMedicamentos, observacoes: @prescricao.observacoes } }
    assert_redirected_to prescricao_url(@prescricao)
  end

  test "should destroy prescricao" do
    assert_difference("Prescricao.count", -1) do
      delete prescricao_url(@prescricao)
    end

    assert_redirected_to prescricaos_url
  end
end
