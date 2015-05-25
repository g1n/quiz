class ProgressesController < ApplicationController

    def index
	@progresses = Progress.all
    end

    def show
	#@progress = Progress.find(params[:level])
	@progress = Progress.find_by! level: params[:level]
    end

    def new
	@progress = Progress.new
    end

    def edit
	#@progress = Progress.find(params[:level])
	@progress = Progress.find_by! level: params[:level]
    end

    def create
        #render plain: params[:progress].inspect        
        @progress = Progress.new(progress_params)
        
        if @progress.save
    	    redirect_to @progress
    	else
    	    render 'new'
    	    #redirect_to new_progress_path
    	end
    end

    def update
	#@progress = Progress.find(params[:level])
	@progress = Progress.find_by! level: params[:level]
	
	if @progress.update(progress_params)
	    redirect_to @progress
	else
	    render 'edit'
	end
    end

    def destroy
	#@progress = Progress.find(params[:level])
	@progress = Progress.find_by! level: params[:level]
	@progress.destroy
	
	redirect_to progresses_path
    end

    private
	def progress_params
	    params.require(:progress).permit(:user, :level)
	end
end
