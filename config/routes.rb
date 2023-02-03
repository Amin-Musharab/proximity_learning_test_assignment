Rails.application.routes.draw do
  resources :personal_data do
    resources :employments
  end

  get "/retrieve_employments", to: "personal_data#retrieve_employments"
  root "personal_data#index"
end
