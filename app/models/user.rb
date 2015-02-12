class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# class User::ParameterSanitizer < Devise::ParameterSanitizer
#   def sign_in
#     default_params.permit(:first_name, :last_name, :github_account)
#   end
# end

end
