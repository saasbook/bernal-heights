class CreateAdminService
  def call
    user = Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |user|
        user.password = ENV['ADMIN_PASSWORD']
        user.password_confirmation = ENV['ADMIN_PASSWORD']
        user.admin = true
      end
  end
end