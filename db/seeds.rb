u = User.new(
  email: 'admin@alliance.org',
  title: 'Admin',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save!
u.add_role :admin
u.save!
