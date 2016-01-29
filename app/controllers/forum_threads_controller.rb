class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @forum_threads = ForumThread.paginate(page: params[:page])
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
  end

  def new
    @forum_thread = current_user.forum_threads.build
  end

  def create
    @forum_thread = current_user.forum_threads.build(forum_thread_params)

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render 'new'
    end
  end

  def edit
    @forum_thread = ForumThread.find(params[:id])
  end

  def update
    @forum_thread = ForumThread.find(params[:id])

    if @forum_thread.update(forum_thread_params)
      redirect_to @forum_thread
    else
      render 'edit'
    end
  end

  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy

    redirect_to forum_threads_path
  end


  private

    def forum_thread_params
      params.require(:forum_thread).permit(:title, :body)
    end
end
