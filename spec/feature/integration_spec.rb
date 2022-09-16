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
    expect(:notice).to be_present
    visit books_path
    expect(page).to have_content('harry potter')
    click_on 'Show'
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
    expect(page).to have_content('2022-03-12')
    expect(page).to have_content('60')
  end

  scenario 'invaild input no inputs' do
    visit new_book_path
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Author can\'t be blank')
    expect(page).to have_content('Price can\'t be blank')
  end
end


RSpec.describe 'Editing a book', type: :feature do
  before do
    Book.create!(title: 'test', author: 'test', price:1, published_date: Date.new(2022, 1, 1))
  end
  scenario 'editing an existing book-valid inputs' do
    visit books_path
    click_on 'Edit'
    fill_in 'book_title', with: 'harry potter'
    fill_in 'book_author', with: 'jk rowling'
    fill_in 'book_price', with: 60
    select "2022", :from => "book_published_date_1i"
    select "March", :from => "book_published_date_2i"
    select "12", :from => "book_published_date_3i"
    click_on 'Update Book'
    click_on 'Back'
    click_on 'Show'
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
    expect(page).to have_content('2022-03-12')
    expect(page).to have_content('60')
  end
  scenario 'editing an existing book-invalid inputs' do
    visit books_path
    click_on 'Edit'
    fill_in 'book_title', with: ''
    fill_in 'book_author', with: ''
    click_on 'Update Book'
    expect(page).to have_content('prohibited this book from being saved')
  end
end
