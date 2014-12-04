class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.name = Rails.application.secrets.admin_name
        user.ministry = %W(Koinonia A2F Klesis ThirdSpace).shuffle[0]
      	user.year = rand(1980..2014)
      end
  end
end
