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

      visit doctor_path(@doctor2)
      expect(page).to have_content("#{@doctor2.name}'s Show Page")
      expect(page).to have_content(@doctor2.name)
      expect(page).to have_content(@doctor2.specialty)
      expect(page).to have_content(@doctor2.university)
    end

    it 'I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor1)
      
      expect(page).to have_content(@hospital1.name)

      visit doctor_path(@doctor3)

      expect(page).to have_content(@hospital2.name)
    end

    it 'I see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor1)

      expect(page).to have_content("Patients:")

      within "#patients-#{@patient1.id}" do
        expect(page).to have_content(@patient1.name)
      end

      within "#patients-#{@patient2.id}" do
        expect(page).to have_content(@patient2.name)
      end

      visit doctor_path(@doctor2)

      expect(page).to have_content("Patients:")

      within "#patients-#{@patient3.id}" do
        expect(page).to have_content(@patient3.name)
      end

      within "#patients-#{@patient4.id}" do
        expect(page).to have_content(@patient4.name)
      end
    end

    it 'I see a button to remove that patient from that doctors caseload' do
      visit doctor_path(@doctor1)

      within "#patients-#{@patient1.id}" do
        expect(page).to have_link("Remove Patient #{@patient1.id}")
      end

      within "#patients-#{@patient2.id}" do
        expect(page).to have_link("Remove Patient #{@patient2.id}")
      end

      visit doctor_path(@doctor2)

      within "#patients-#{@patient3.id}" do
        expect(page).to have_link("Remove Patient #{@patient3.id}")
      end

      within "#patients-#{@patient4.id}" do
        expect(page).to have_link("Remove Patient #{@patient4.id}")
      end
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
