# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading

# Feature:
# As a guest user (no sign in necessary)
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."

# As a guest user
# When I visit "/"
# And I fill in a text box with "foxez"
# And I click "Validate Word"
# Then I should see a message that says "'foxez' is not a valid word."

require 'rails_helper'

describe 'as a guest user' do
  scenario 'visiting the root path, I can submit a word for validation' do
  # When I visit "/"

  visit '/'

  within('.word-search') do 
    # And I fill in a text box with "foxes"
    fill_in 'word', with: 'Foxes'
    # And I click "Validate Word"
    click_on 'Validate Word'
  end

  # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
  expect(page).to have_content( "'foxes' is a valid word and its root form is 'fox'.")
  end
end