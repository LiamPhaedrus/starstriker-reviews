class AdminSeeder

  def self.seed!
    User.create(
      username: 'philip',
      email: 'philipormorgan@gmail.com',
      admin: true,
      password: 123456
    )
    User.create(username: 'Mike', email: 'michael.winslow331@gmail.com',
    admin: true, password: 123456)
    User.create(username: 'Liam', email: 'liamphaedrusgmail.com',
    admin: true, password: 123456)
    User.create(username: 'Matt', email: 'matthewriebow@gmail.com',
    admin: true, password: 123456)
  end
end
