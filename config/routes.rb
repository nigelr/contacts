Contacts::Application.routes.draw do


  get "dashboard/index"

  scope "ams" do
    devise_for :contacts
    resources :contacts
    resources :dashboards
    root :to => "dashboards#index"
  end

end
