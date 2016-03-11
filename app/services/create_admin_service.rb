class CreateAdminService
  def call
    user = User.find_or_create_by!(email: ENV['admin_email']) do |user|
        user.password = ENV['admin_password']
        user.password_confirmation = ENV['admin_password']
        user.admin = true
      end
  end
end