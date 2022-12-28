Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: "public/homes#top"
  get '/about' => "public/homes#about", as:"about"

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index,:create,:update,:destroy] do
      collection do
        delete 'all_destroy'
      end
      get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
      get "/customers/my_page" => "customers#show", as: "my_page"
      get "/customers/infomation/edit" => "customers#edit", as: "infomation/edit"
      patch "/customers/infomation" => "customers#update", as: "infomation"
      resources :customers
    end
  end



  namespace :admin do
    get '/'  => "homes#top", as: "/"
    resources :items
    resources :genres
    resources :customers
    get '/customers/:id/orders' => 'customers#orders', as: "customer/orders"
    resources :orders
    resources :order_items
  end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
