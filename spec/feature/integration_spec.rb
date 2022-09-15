# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'author', with: 'jk rowling'
    fill_in 'price', with: 60
    select "2022", :from => "published_date_1i"
    select "March", :from => "published_date_2i"
    select "12", :from => "published_date_3i"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end