class RunnersController < ApplicationController
  def new
  end
  def profile
    @runner = Runner.find(params[:id])
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
end

