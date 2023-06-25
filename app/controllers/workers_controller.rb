class WorkersController < ApplicationController
    def index
      @workers = Worker.all
    end
  
    def new
      @worker = Worker.new
    end
  
    def create
      @worker = Worker.new(worker_params)
      if @worker.save
        redirect_to workers_path
      else
        render 'new'
      end
    end

    def show
        @worker = Worker.find(params[:id])
        @shifts = @worker.shifts
    end
  
    def edit
      @worker = Worker.find(params[:id])
    end
  
    def update
      
      @worker = Worker.find(params[:id])
      if @worker.update(worker_params)
        redirect_to workers_path
      else
        render 'edit'
      end
    end
  
    def destroy
        binding.pry
        @worker = Worker.find(params[:id])
        @worker.destroy
        redirect_to workers_path
    end

    def delete_worker
        @worker = Worker.find(params[:id])
        @worker.shifts.destroy_all
        if @worker.destroy
          redirect_to workers_path, notice: 'Worker deleted successfully.'
        else
          redirect_to workers_path, alert: 'Failed to delete worker.'
        end
    end
    
  
    private
  
    def worker_params
      params.require(:worker).permit(:name, :status)
    end
    
  end