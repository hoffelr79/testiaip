desc "load admin default"
task :default_admin => :environment do 
	User.create(email: 'admins@iaip.gob.sv', password: '123456', password_confirmation: '123456')
end