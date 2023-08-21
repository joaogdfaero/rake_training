namespace :utils do
  desc "Popular a tabela users com 50 nomes"
  task setup_user_50: :environment do
    if Rails.env.development?
      50.times do |i|
        user_name = Faker::Name.name
        user_email = Faker::Internet.email
        user = "#{user_name} #{user_email}"
        puts "Cadastrando o #{user}"
        User.create(name: user_name, email: user_email)
      end
    else
      puts "Não está em modo desevolvimento"
    end
  end
end
