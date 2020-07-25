class SessionsController < Clearance::SessionsController
  private

  def authenticate(_)
    super(session_params)
  end

  def session_params
    { session: session_params_with_email }
  end

  def session_params_with_email
    params
      .require(:session)
      .permit(:password)
      .merge(email: user.email)
  end

  def user
    User.find_user_by_email_or_name(email_or_username) || Guest.new
  end

  def email_or_username
    params.dig(:session, :email_or_username)
  end
end
