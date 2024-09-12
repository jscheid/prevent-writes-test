# frozen_string_literal: true

Rails.application.routes.draw do
  root 'ping#root'
  get 'ping' => 'ping#ping'
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'stream' => 'live#stream'
end
