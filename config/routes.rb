Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :memes, only: [:index, :show, :create]
      post '/memes/upvote/:id', to: 'memes#upvote', as: 'memes_upvote'
      post '/memes/downvote/:id', to: 'memes#downvote', as: 'memes_downvote'
    end
  end
end
