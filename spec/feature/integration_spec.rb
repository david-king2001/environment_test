# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book_title', with: 'harry potter'
    fill_in 'book_author', with: 'jk rowling'
    fill_in 'book_price', with: 60
    select "2022", :from => "book_published_date_1i"
    select "March", :from => "book_published_date_2i"
    select "12", :from => "book_published_date_3i"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end