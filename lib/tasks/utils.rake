namespace :utils do
  desc "Popular a tabela users com 50 nomes"
  task setup_user_qtd: :environment do
    if (ARGV.size == 2) && (ENV['QTD'] != '') 
      if Rails.env.development?
        ENV['QTD'].to_i.times do |i|
          user_name = Faker::Name.name
          user_email = Faker::Internet.email
          user = "#{user_name} #{user_email}"
          puts "Cadastrando o #{user}"
          User.create(name: user_name, email: user_email)
        end
      else
        puts "Não está em modo desevolvimento"
      end
    else
      puts "Envie a quantidade no modelo QTD=10"
    end
  end
end
