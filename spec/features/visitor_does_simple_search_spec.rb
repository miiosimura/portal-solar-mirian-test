require 'rails_helper'

feature 'Visitor does a simple search' do
  scenario 'successfully' do
    create(:power_generator)

    visit root_path
    fill_in 'O que você procura?', with: 'trifásico'
    click_on 'Pesquisa Simples'

    expect(page).to have_content('Encontramos 1 resultado(s) de painel solar para a sua busca')
    expect(page).to have_link('TRIFÁSICO 380V')
  end

  scenario 'and finds no results' do
    create(:power_generator)

    visit root_path
    fill_in 'O que você procura?', with: 'monofásico'
    click_on 'Pesquisa Simples'

    expect(page).to have_content('Nenhum resultado foi encontrado')
  end

  scenario 'and the value is invalid' do
    visit root_path
    fill_in 'O que você procura?', with: 'a'
    click_on 'Pesquisa Simples'

    expect(page).to have_content('O valor da busca deve conter mais de 1 caracter')
  end
end