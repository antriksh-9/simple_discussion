SimpleDiscussion::Engine.routes.draw do
  scope module: :simple_discussion do
    resources :forum_threads, path: :threads do
      collection do
        get :answered
        get :unanswered
        get :mine
        get :spam
        get :participating
        get "category/:id", to: "forum_categories#index", as: :forum_category
      end

      member do
        put :mark_as_spam
        put :unmark_as_spam
      end

      resources :forum_posts, path: :posts do
        member do
          put :solved
          put :unsolved
        end
      end

      resource :notifications
    end
  end

  root to: "simple_discussion/forum_threads#index"
end
