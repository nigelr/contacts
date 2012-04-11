Contacts::Application.routes.draw do

  scope "ams" do
    resources :contacts
  end

  root :to => "contacts#index"
end
