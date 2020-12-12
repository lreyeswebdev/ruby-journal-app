class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.where(user_id: current_user.id).order(deadline: :desc)
    end

    def today
        @tasks_incomplete = Task.where(user_id: current_user.id, completed: false, deadline: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(deadline: :desc)
    end
   
    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        @task.user = current_user

        if @task.save
            redirect_to category_tasks_path
        else
            render :new
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        

        if @task.update(task_params)
            redirect_to category_tasks_path
        else
            render :edit
        end
    end

    def destroy
        
        @task.destroy
        redirect_to category_tasks_path
    end

    private
    def get_category
        
        # @category = Category.find(params[:category_id]) if params[:category_id].present?
        if params[:category_id]
            @category = Category.find(params[:category_id])
        end
        
    end

    def set_category
        @task = @category.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :details, :deadline, :completed, :started, :category_id)
    end

end
