class SimpleDiscussion::UsersController < SimpleDiscussion::ApplicationController

    def show
        @user = User.find(params[:id])
        @forum_posts = @user.forum_posts

    end
end
  