class SessionsController < ApplicationController
  def index
    @runner=Runner.order(shoe_size: :desc)
  end
  def register

    end
  def create
    if Runner.create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password],gender:params[:gender],shoe_size:params[:shoe_size])
      flash[:notice]="Successfully Registered"
      redirect_to "/"
    end
  end
  def login
    r = Runner.find_by_email(params[:email])
      if ( r && r.authenticate(params[:password]))
        session[:user_id] = r.id
        redirect_to "/runners/#{r.id}"
      else
        redirect_to "/"
      end
  end
  def login1
  end
  def destroy
    reset_session
    redirect_to '/'
  end

end
