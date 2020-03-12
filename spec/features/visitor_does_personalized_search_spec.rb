require 'rails_helper'

feature 'Visitor does a personalized search' do
  scenario 'successfully' do
    create(:power_generator)

    visit root_path
    fill_in 'Informe a quantidade de kWh consumida em um mês', with: '100'
    click_on 'Pesquisa Avançada'

    expect(page).to have_content('1 resultado(s) encontrados')
    expect(page).to have_link('TRIFÁSICO 380V')
  end
end