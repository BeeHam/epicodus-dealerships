require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# include Capybara::DSL

describe('path to view all dealerships', {:type => :feature}) do
  it('sends user to dealership list') do
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content("Dealerships")
  end
end

describe('path to add new dealership', {:type => :feature}) do
  it('sends the user to a form to add a dealership') do
    visit('/')
    click_link('Add New Dealership')
    expect(page).to have_content("Add dealerships")
  end
end

describe('path for dealerships form', {:type => :feature}) do
  it('processes user entry and adds a dealership') do
    visit('/dealerships/new')
    fill_in("name", :with => "Bob's Used Cars")
    click_button('Add Dealership')
    expect(page).to have_content("Success")
  end
end

describe('path to dealership list', {:type => :feature}) do
  it('sends user to dealership list') do
    visit('/dealerships/new')
    fill_in("name", :with => "Janice's")
    click_button('Add Dealership')
    click_link('See Dealership List')
    expect(page).to have_content("Dealerships")
  end
end

describe("path to a specific dealership's list of cars", {:type => :feature}) do
  it('sends user to list of cars') do
    visit('/dealerships')
    click_link("Bob's Used Cars")
    expect(page).to have_content("Here are all the cars in this dealership:")
  end
end

describe("path to add new vehicle to a dealership", {:type => :feature}) do
  it('processes user entry and adds new vehicle') do
    visit('/dealerships/1')
    click_link("Add a new vehicle")
    expect(page).to have_content("Add a vehicle to Bob's Used Cars")
  end
end
