class AdminSeeder
  ADMINS = [
    {
      username: 'philip',
      email: 'philipormorgan@gmail.com',
      admin: true,
      password: 123456
    }, {
      username: 'Mike',
      email: 'michael.winslow331@gmail.com',
      admin: true,
      password: 123456
    }, {
      username: 'Liam',
      email: 'liamphaedrus@gmail.com',
      admin: true,
      password: 123456
    }, {
      username: 'Matt',
      email: 'matthewriebow@gmail.com',
      admin: true,
      password: 123456
    }
  ]

  def self.seed!
    ADMINS.each do |admin_params|
      email = admin_params[:email]
      admin = User.find_or_initialize_by(email: email)
      admin.assign_attributes(admin_params)
      admin.save!
    end
  end
end
