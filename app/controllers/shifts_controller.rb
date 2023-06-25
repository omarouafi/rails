# app/controllers/shifts_controller.rb
class ShiftsController < ApplicationController
    before_action :set_shift, only: [:show, :edit, :update, :destroy]
  
    def index
      @shifts = Shift.all
    end
  
    def show
    end
  
    def new
      @shift = Shift.new
    end
  
    def create
      @shift = Shift.new(shift_params)
      if @shift.save
        redirect_to shifts_path, notice: 'Shift was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @shift.update(shift_params)
        redirect_to shifts_path, notice: 'Shift was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @shift.destroy
      redirect_to shifts_path, notice: 'Shift was successfully deleted.'
    end
  
    private
  
    def set_shift
      @shift = Shift.find(params[:id])
    end
  
    def shift_params
      params.require(:shift).permit(:start_date, :worker_id)
    end
  end
  