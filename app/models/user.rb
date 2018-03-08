class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, 
         :trackable,
         :validatable, :omniauthable, omniauth_providers: [:facebook,:google_oauth2,:github]


  has_many :identities, dependent: :destroy


  def self.from_omniauth(auth,sign)


        user = Identity.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            puts "Sign Value = #{sign}"
           if sign==1
            unless registered_user.nil? 
                        Identity.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                sign=3
                registered_user
            else
                user = User.create!(
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20],
                            )
                user_provider = Identity.create!(
                    provider:auth.provider,
                            uid:auth.uid,
                              user_id: user.id
                    )
                sign=3
                user
            end
          end
        end
  end
  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
     end
   end
  end
end
