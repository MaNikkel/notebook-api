namespace :dev do
  desc 'Configure the application for development'
  task setup: :environment do
    puts 'Generating contacts...'
    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end

    puts 'Done!'
  end
end
