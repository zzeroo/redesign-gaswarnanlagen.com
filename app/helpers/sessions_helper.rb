# Sessions Helper
module SessionsHelper

  # Sign in user
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  # Check if user is signed in.
  def signed_in?
    !current_user.nil?
  end

  # Sets the current user.
  def current_user=(user)
    @current_user = user
  end

  # Constructs a new remember token (used in session cookies) and
  # return the current user or nil if not found.
  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # Check if user is current user.
  #
  # @return true || false
  def current_user?(user)
    user == current_user
  end

  # Check if sigened in, if not this function redirects to signin_url
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Bitte anmelden"
    end
  end

  # Check if user is admin.
  def admin_user
    if not signed_in?
      store_location
      redirect_to signin_url, notice: "Bitte anmelden"
    elsif not current_user.admin?
      redirect_to root_url, notice: "Keine ausreichenden Berechtigungen!"
    end
  end

  # Sign out function.
  #
  # Updates the remember_token, deletes the session cookies and reset current_user.
  def sign_out
    current_user.update_attribute(:remember_token,
                                 User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # Helper to redirect to a given url, if not found to the default url
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # Helper function for redirect_back_or().
  #
  # It stores the return path.
  def store_location
    session[:return_to] = request.url if request.get?
  end
end
