# Sessions controller
class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # GET /sessions/creat
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Ungültige Password/ Email Kombination'
      render 'new'
    end
  end

  # DELETE /session/1
  def destroy
    sign_out
    redirect_to root_url
  end
end
