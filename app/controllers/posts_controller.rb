class PostsController < ApplicationController
  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @post = @forum_thread.posts.create(post_params)
    redirect_to forum_thread_path(@forum_thread)
  end


  private
    def post_params
      params.require(:post).permit(:poster, :body)
    end
end
