Contacts::Application.routes.draw do


  scope "ams" do
    devise_for :contacts
    resources :contacts
    root :to => "contacts#index"
  end

end
