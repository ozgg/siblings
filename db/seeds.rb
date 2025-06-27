# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

[%w[Паша 2020-06-10], %w[Лиза 2025-05-19]].each do |data|
  next if Sibling.exists?(name: data[0])

  Sibling.create!(name: data[0], birthday: data[1])
end

pavel = Sibling.find_by(name: 'Паша')
dir = Rails.root.join('tmp/import/siblings/1/diary').to_s
if Dir.exist?(dir)
  Rails.logger.debug { 'Seeding diary for Pavel' }
  Dir.glob("#{dir}/*").map { |d| File.basename(d) }.map(&:to_i).sort.each do |part|
    pwd = "#{dir}/#{part}"

    Dir.glob("#{pwd}/*.yml").map { |f| File.basename(f) }.map(&:to_i).each do |id|
      File.open("#{pwd}/#{id}.yml", 'r') do |file|
        YAML.load(file, permitted_classes: [Date]).each do |date, data|
          image = data['image']
          post = Post.find_or_initialize_by(sibling: pavel, date:)
          post.title = data['title'].to_s
          post.body = data['body']
          post.image.attach(io: File.open("#{pwd}/#{image}"), filename: image) if image.present?
          post.save!
          Rails.logger.debug { "Saved post #{post.date}" }
        end
      end
    end
  end
else
  Rails.logger.warn { "Cannot find sibling import dir: #{dir}" }
end
