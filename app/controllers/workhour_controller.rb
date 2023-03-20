class WorkhourController < ApplicationController 
    before_action :authenticate_user!
    respond_to :json
  
    def index
      workhour = Workhour.all
      render json: workhour, status: 200
    end
  
    def create
      workhour = Workhour.new(workhour_params.merge(user_id: current_user.id))
      if workhour.save
        render json: workhour, status: 200
      else
        render json: { errors: workhour.errors }, status: 422
      end
    end
  
    def show
        date = Date.today
        total_time = Workhour.calculate_total_time(current_user.id, date)
      
        render json: { total_time: total_time }
    end
      
    
    def destroy
      current_user.Workhour.destroy
      render json: "Record has been deleted"
    end
  
    private
  
    def workhour_params
      params.require(:workhour).permit(:type, :time, :date)   
    end
  
  end
