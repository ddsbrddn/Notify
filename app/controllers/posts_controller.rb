class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: :destroy

  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @post = @forum_thread.posts.create(post_params)
    @post.user = current_user
    if @post.save

      # Create the notificaation
      (@forum_thread.users.uniq - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @post)
      end

      redirect_to forum_thread_path(@forum_thread)
    else
      render 'forum_threads/show'
    end
  end

  def destroy
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @post = @forum_thread.posts.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to forum_thread_path(@forum_thread)
  end


  private
    def post_params
      params.require(:post).permit(:body)
    end

    def corrent_user
      @post = current_user.post.find_by(id: params[:id])
    end
end
