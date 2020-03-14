require 'rails_helper'

feature 'Visitor calculate delivery tax' do
  scenario 'successfully' do
    create(:power_generator)
    create(:freight)

    visit root_path
    click_on 'TRIFÁSICO 380V'
    fill_in 'Informe seu CEP', with: '03726190'
    click_on 'Calcular Frete'

    expect(page).to have_content('Valor do Frete: R$ 500,00')
  end
end