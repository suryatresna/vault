Rails.application.routes.draw do
  mount Vault::Engine => "/vault"
end
