class ForumThreadsController < ApplicationController

  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def new
    @forum_thread = ForumThread.new
  end

  def create
    @forum_thread = ForumThread.new(forum_thread_params)

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render 'new'
    end
  end


  private

    def forum_thread_params
      params.require(:forum_thread).permit(:title, :body)
    end
end
