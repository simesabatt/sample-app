class TasksController < ApplicationController

  def new
    @task = Task.new
    @user = current_user.id
  end
  
  def create
    @user = current_user.id
    # @task = @user.tasks.build(task_params) ←これが良いみたいだけど・・・
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクを新規作成しました。'
      redirect_to user_tasks_url
    else
      flash[:alert] = '新規投稿に失敗しました。'
      render :new
    end
  end
  
  def index
    @tasks = Task.all
    @user = current_user.id
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    redirect_to user_tasks_url
  end

  private
  
    def task_params
      params.require(:task).permit(:task_title, :task_detail, :user_id)
    end
end
