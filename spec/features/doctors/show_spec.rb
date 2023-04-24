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

      expect(page).to have_content("Patients:")
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
    end

    it 'I see a button to remove that patient from that doctors caseload' do
      visit doctor_path(@doctor1)

      expect(page).to have_link("Remove Patient #{@patient1.id}")
    end

    it 'When I click that button for one patient I am brought back to the 
        doctors show page and I no longer see that patient listed, but 
        I still see that patient name on other doctor show pages that they have' do 
        visit doctor_path(@doctor1)

        click_link("Remove Patient #{@patient1.id}")

        expect(current_path).to eq(doctor_path(@doctor1))

        expect(page).to_not have_content(@patient1.name)

        visit doctor_path(@doctor2)

        expect(page).to have_content(@patient1.name)
    end
  end
end


# User Story 2, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
# And when I visit a different doctor's show page that is caring for the same patient,
# Then I see that the patient is still on the other doctor's caseload

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