require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the patients index page' do
    before do
      test_data
    end

    it 'I see the names of all adult patients (over 18)' do
      visit patients_path

      expect(page).to have_content("Adult Patients Index Page")
      expect(page).to_not have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      expect(page).to have_content(@patient4.name)
      expect(page).to have_content(@patient5.name)
      expect(page).to have_content(@patient6.name)
    end

    it 'And I see the names are in ascending alphabetical order' do
      visit patients_path

      within "#adult_patients" do

        expect(@patient2.name).to appear_before(@patient5.name)
        expect(@patient5.name).to appear_before(@patient3.name)
        expect(@patient3.name).to appear_before(@patient6.name)
        expect(@patient6.name).to appear_before(@patient4.name)
      end
    end
  end
end
# User Story 3, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all adult patients (age is greater than 18),
# And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)