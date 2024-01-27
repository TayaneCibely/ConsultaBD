require "application_system_test_case"

class ProntuariosTest < ApplicationSystemTestCase
  setup do
    @prontuario = prontuarios(:one)
  end

  test "visiting the index" do
    visit prontuarios_url
    assert_selector "h1", text: "Prontuarios"
  end

  test "should create prontuario" do
    visit prontuarios_url
    click_on "New prontuario"

    fill_in "Codigo", with: @prontuario.codigo
    fill_in "Datacriacao", with: @prontuario.dataCriacao
    fill_in "Historico", with: @prontuario.historico
    click_on "Create Prontuario"

    assert_text "Prontuario was successfully created"
    click_on "Back"
  end

  test "should update Prontuario" do
    visit prontuario_url(@prontuario)
    click_on "Edit this prontuario", match: :first

    fill_in "Codigo", with: @prontuario.codigo
    fill_in "Datacriacao", with: @prontuario.dataCriacao
    fill_in "Historico", with: @prontuario.historico
    click_on "Update Prontuario"

    assert_text "Prontuario was successfully updated"
    click_on "Back"
  end

  test "should destroy Prontuario" do
    visit prontuario_url(@prontuario)
    click_on "Destroy this prontuario", match: :first

    assert_text "Prontuario was successfully destroyed"
  end
end
