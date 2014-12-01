class CreatePersonService
  @@totalUsers = 0
  def call
    em = "user"+@@totalUsers.to_s+"@example.com"
    user = User.find_or_create_by!(email: em) do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.name = "User"+@@totalUsers.to_s
    end
    @@totalUsers += 1
    return user
  end
end
