require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a doctors show page' do
    before do
      test_data
    end

    it 'I see all of that doctors information' do
      visit doctor_path(@doctor1)

      expect(page).to have_content("#{@doctor1.name}'s Show Page")
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
    end

    it 'I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor1)
      
      expect(page).to have_content(@hospital1.name)
    end

    it 'I see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor1)
save_and_open_page
      expect(page).to have_content("Patients:")
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
    end
  end
end

# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has