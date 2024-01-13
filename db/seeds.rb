puts '====== Seeding DB.'

100.times do
  Article.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts '====== Seeding Done.'
