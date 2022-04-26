namespace :dev do
  desc 'Configure the application for development'
  task setup: :environment do
    puts 'Generating Kinds...'

    contacts_kinds = %w[Amigos Familiares Colegas Trabalho]

    contacts_kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts 'Generating contacts...'

    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts 'Generating phones...'

    Contact.all.each do |contact|
      rand(1..5).times do |_i|
        phone = Phone.create!(number: Faker::PhoneNumber.phone_number)
        contact.phones << phone
        contact.save!
      end
    end

    puts 'Done!'
  end
end
