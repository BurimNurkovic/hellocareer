Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :companies, :controllers => {:confirmations => 'companies/confirmations'}
  devise_scope :company do
    patch "/confirm" => "companies/confirmations#confirm"
    namespace :companies, as: 'company' do
      resource :registration, :only => [:edit, :update]
    end
  end
  namespace :companies do
    resource :profile, :only => :update
  end

  devise_for :admins
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  namespace :users do
    resource :profile, :only => :update
  end

  root 'home#index'
  get :terms, :to => 'home#terms'
  get :about, :to => 'home#about'
  get :render_navbar, :to => 'home#render_navbar'

  resources :advertisements, :only => [:show, :index]

  namespace :api do
    resource :email, :only => [] do
      post :subscribe
    end

    resources :questions, :only => [] do
      get :special_data, :on => :member
    end

    resources :blog_posts, :only => [] do
      get :recent, :on => :collection
    end
  end

  namespace :admin do
    root :to => 'dashboard#home_page'
    resources :resumes, :only => [:index, :show] do
      get :search, :on => :collection
    end
    resources :content_boxes
    get :home_page, :footer, :about_us, :terms, :controller => 'dashboard'
    resources :partners, :except => [:new, :show]
    resources :benefits, :except => [:new, :show]
    resources :testimonials, :except => [:new, :show]
    resources :terms_chapters, :except => [:new, :show]
    resources :team_members, :except => [:new, :show]
    resources :companies do
      resource :subscription, :only => [:show, :update]
    end
    resources :resume_templates
    resources :questions, :except => :show do
      post '/update_order', :to => 'questions#update_order', :on => :collection
    end

    resources :advertisements, :only => [:index, :show, :destroy]
  end

  namespace :users do
    get :dashboard, :to => 'dashboard#index'
  end

  namespace :companies do
    root :to => 'dashboard#index'
    resources :advertisements
    resources :resumes do
      get :search, :on => :collection
      post :premium, :on => :member
    end
  end

  resources :resumes do
    post :preview, :on => :collection
  end

  resources :motivational_letters, :path => 'cover-letter'

  delete '/destroy-answer', to: 'resumes#destroy_answer_category', defaults: { format: 'js' }
end
