Rails.application.routes.draw do

  # resources :patients
  resources :doctors do
    resources :patients
  end
  # delete 'doctors/:doctor_id/patients/:patient_id', to: 'patient_doctors#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
