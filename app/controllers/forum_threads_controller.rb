class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_permission, only: [:edit, :destroy]

  def index
    @forum_threads = ForumThread.paginate(page: params[:page]).order('id DESC')
  end

  def show
    @forum_thread = ForumThread.friendly.find(params[:id])
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
    @forum_thread = ForumThread.friendly.find(params[:id])
  end

  def update
    @forum_thread = ForumThread.friendly.find(params[:id])

    if @forum_thread.update(forum_thread_params)
      redirect_to @forum_thread
    else
      render 'edit'
    end
  end

  def destroy
    @forum_thread = ForumThread.friendly.find(params[:id])
    @forum_thread.destroy

    redirect_to forum_threads_path
  end


  private

    def forum_thread_params
      params.require(:forum_thread).permit(:title, :body)
    end

    def require_permission
      if current_user != ForumThread.friendly.find(params[:id]).user
        redirect_to forum_thread_path
        flash[:danger] = "You don't have permission to edit or delete this thread"
      end
    end
end
