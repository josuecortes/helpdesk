Rails.application.routes.draw do

  resources :problemas

  resources :chamados do

    get :fechar_chamado

    get :cancelar_chamado

    get :pegar_chamado

    get :concluir_chamado

    get :em_atendimento, :on => :collection

    get :concluidos, :on => :collection

    get :cancelados, :on => :collection

    get  :fechados, :on => :collection

    get :autocomplete_problema_descricao, :on => :collection
    
  end

  resources :inventarios

  resources :items

  resources :itens

  resources :departamentos

  get 'home/index'
  get 'home/nao_autorizado'
  
  resources :usuarios do

    get :redefinir_senha

    get :autocomplete_departamento_nome, :on => :collection

  end
  
  devise_for :users
  resources :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
end
