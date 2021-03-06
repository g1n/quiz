class AttemptsController < ApplicationController

	def index
		@attempts = Attempt.all
	end
	
	def destroy
	@attempt = Attempt.find(params[:id])
	@attempt.destroy
	
	redirect_to attempts_path
    end
	
	def destroy_all
	Attempt.destroy_all
	
	redirect_to attempts_path
    end
end
