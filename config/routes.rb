Rails.application.routes.draw do
  get 'samples/index'

  get 'samples/new'

  get 'samples/create'

  get 'samples/destroy'

  get 'sample/index'

  get 'sample/new'

  get 'sample/create'

  get 'sample/destroy'

  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

   resources :tests

   resources :resumes, only: [:index, :new, :create, :destroy]

   resources :samples do
  		collection { post :import }
	end
   root "samples#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
