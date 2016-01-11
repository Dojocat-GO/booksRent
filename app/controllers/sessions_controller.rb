class SessionsController < ApplicationController
  def new
  end
  def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
  # 登入用户，然后重定向到用户的资料页面
 # if user.activated?
log_in user
params[:session][:remember_me] == '1' ? remember(user) : forget(user)
redirect_back_or user
=begin
 else
message = "Account not activated. "
message += "Check your email for the activation link."
flash[:warning] = message
redirect_to root_url
  end
=end
  else
  # 创建一个错误消息
  flash.now[:danger] = 'Invalid email/password combination' # 不完全正确
  render 'new'
  end
  end
  def destroy
    log_out if logged_in?
redirect_to root_url
  end
end
