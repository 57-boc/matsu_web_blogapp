Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # rootを home#indexにしろということ

  get '/about' => 'home#about'
  # ↑home#index はhome_controller.rbのaboutを実行しろということ
end
