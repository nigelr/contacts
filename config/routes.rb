Contacts::Application.routes.draw do


  get "dashboard/index"

  scope "ams" do
    devise_for :contacts
    resources :contacts
    root :to => "contacts#index"
    resources :dashboards
  end

end
