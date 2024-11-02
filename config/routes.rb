# frozen_string_literal: true

Rails.application.routes.draw do
  resources :moon_batteries, param: :serial_number, only: [] do
    collection do
      post :register
    end

    member do
      put :ping
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
