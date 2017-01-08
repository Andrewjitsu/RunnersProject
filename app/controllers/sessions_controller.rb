class SessionsController < ApplicationController
  def index
    @runner=Runner.order(shoe_size: :desc)
  end
  def create
    @runner=Runner.new(user_params)
    if @runner.save
      flash[:notice]="Successfully Registered"
      redirect_to "/runners"
    end
  end
  def login
    r = Runner.find_by_email(params[:email])
      if ( r && r.authenticate(params[:password]))
        session[:user_id] = r.id

        redirect_to "/runners/#{r.id}"
      else
        flash[:error] = "Invalid Login Information"
        redirect_to "/runners"
      end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
  private
    def user_params
      params.require(:runner).permit(:first_name, :last_name, :email, :password, :gender, :shoe_size, :avatar)
    end
end
