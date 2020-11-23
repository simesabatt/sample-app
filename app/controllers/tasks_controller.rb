class TasksController < ApplicationController

  def new
    @task = Task.new
    @user = current_user.id
  end
  
  def create
    @user = current_user.id
    # @task = @user.tasks.build(task_params) ←これが良いみたいだけどうまく行かず・・・
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
    @tasks = Task.all.order(created_at: :desc)
    @user = current_user.id
  end
  
  def show
    @task = Task.find(params[:id])
    @user = current_user.id
  end
  
  def edit
    @task = Task.find(params[:id])
    @user = current_user.id
  end

  def update
    @task = Task.find(params[:id])
    @user = current_user.id
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @user = current_user.id
    @task.destroy
    flash[:success] = "タスクを削除しました"
    redirect_to user_tasks_url(@user, @task)
  end

  private
  
    def task_params
      params.require(:task).permit(:task_title, :task_detail, :user_id)
    end

end
