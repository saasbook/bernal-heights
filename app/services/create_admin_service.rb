class CreateAdminService
  def call(email, password, name)
    user = Admin.find_or_create_by!(email: email) do |user|
        user.password = password
        user.password_confirmation = password
        user.admin = true
        user.name = name
      end
  end
end