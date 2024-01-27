require "application_system_test_case"

class PrescricaosTest < ApplicationSystemTestCase
  setup do
    @prescricao = prescricaos(:one)
  end

  test "visiting the index" do
    visit prescricaos_url
    assert_selector "h1", text: "Prescricaos"
  end

  test "should create prescricao" do
    visit prescricaos_url
    click_on "New prescricao"

    fill_in "Cod", with: @prescricao.cod
    fill_in "Data", with: @prescricao.data
    fill_in "Dosagem", with: @prescricao.dosagem
    fill_in "Listamedicamentos", with: @prescricao.listaMedicamentos
    fill_in "Observacoes", with: @prescricao.observacoes
    click_on "Create Prescricao"

    assert_text "Prescricao was successfully created"
    click_on "Back"
  end

  test "should update Prescricao" do
    visit prescricao_url(@prescricao)
    click_on "Edit this prescricao", match: :first

    fill_in "Cod", with: @prescricao.cod
    fill_in "Data", with: @prescricao.data
    fill_in "Dosagem", with: @prescricao.dosagem
    fill_in "Listamedicamentos", with: @prescricao.listaMedicamentos
    fill_in "Observacoes", with: @prescricao.observacoes
    click_on "Update Prescricao"

    assert_text "Prescricao was successfully updated"
    click_on "Back"
  end

  test "should destroy Prescricao" do
    visit prescricao_url(@prescricao)
    click_on "Destroy this prescricao", match: :first

    assert_text "Prescricao was successfully destroyed"
  end
end
