require 'rails_helper'

feature 'Visitor does a personalized search' do
  scenario 'successfully' do
    create(:power_generator)

    visit root_path
    fill_in 'Informe a quantidade de kWh consumida em um mês', with: '100'
    click_on 'Pesquisa Avançada'

    expect(page).to have_content('Encontramos 1 resultado(s) de painel solar ideal para o seu consumo!')
    expect(page).to have_link('TRIFÁSICO 380V')
  end

  scenario 'and finds no results' do
    create(:power_generator)

    visit root_path
    fill_in 'Informe a quantidade de kWh consumida em um mês', with: '500'
    click_on 'Pesquisa Avançada'

    expect(page).to have_content('Nenhum resultado foi encontrado')
  end

  scenario 'and the value is invalid' do
    create(:power_generator)

    visit root_path
    fill_in 'Informe a quantidade de kWh consumida em um mês', with: '-5'
    click_on 'Pesquisa Avançada'

    expect(page).to have_content('O valor kWh não pode ser negativo')
  end
end
