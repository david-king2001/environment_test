# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new()
  end
  it 'is valid with valid attributes' do
    subject.title = "harry potter"
    subject.author = "jk rowling"
    subject.price = 0
    subject.published_date = Date.now()
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.title = "harry potter"
    subject.author = "jk rowling"
    subject.price = 0
    subject.published_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.title = "harry potter"
    subject.author = "jk rowling"
    subject.price = nil
    subject.published_date = Date.now()
    expect(subject).not_to be_valid
  end

  it 'is not valid without a author' do
    subject.title = "harry potter"
    subject.author = nil
    subject.price = 0
    subject.published_date = Date.now()
    expect(subject).not_to be_valid
  end
end