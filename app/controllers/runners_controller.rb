class RunnersController < ApplicationController
  def new
    @runners=Runner.new
  end
  def profile
    @runners = Runner.all
  end
  def edit
  	@runner=Runner.find(params[:id])
  end
  def update
    r=Runner.find(session[:user_id])
    if r.update(first_name: params[:first_name], last_name: params[:last_name],shoe_size: params[:shoe_size],gender: params[:gender],email: params[:email])
      redirect_to "/runners/#{r.id}"
    end
  end
  private
    def user_params
      params.require(:runner).permit(:first_name, :last_name, :email, :password, :gender, :shoe_size, :avatar)
    end
end

