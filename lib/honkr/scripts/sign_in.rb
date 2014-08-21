module Honkr
  class SignIn

    def self.run(params)
      user= Honkr.db.get_user_by_username(params[:username])

      if user.has_password?(params[:password])
        user_id = Honkr.db.create_session(:user_id => user.id)
        return {
          success?: true,
          session_id: user_id
        }
      else
        return {
          success?: false,
          error: :invalid_password
        }
      end
    end

  end
end
