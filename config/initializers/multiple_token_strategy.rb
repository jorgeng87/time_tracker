# TODO: Move all this to its own Gem for reuse in several projects
module Devise
  module Strategies
    class MultipleTokensStrategy < Devise::Strategies::Base
      def valid?
        params[:auth_token]
      end

      def authenticate!
        user_token = AuthToken.find_by_token(params[:auth_token])

        if user_token
          user = user_token.user
          if user
            user.after_database_authentication
            success!(user)
          end
        end

        if (!(params[:user]) && !halted?)
          fail!("Invalid authentication token.")
        end
      end
    end
  end
end
