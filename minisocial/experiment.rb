@users = []
def create_user
    require "Faker"
    usuario = "#{Faker::Name.unique.name.scan(/[a-zA-Z]+$/)[0]}#{Faker::Internet.free_email.scan(/@[a-z]+\W[a-z]+/)[0]}"
    @users << usuario
    puts usuario
  thousand_posts
end

def thousand_posts
  1000.times do |i|
    require "Faker"
    posting = "#{Faker::Friends.quote}"
    puts posting
  end
end

def seed
  1000.times do |i|
    create_user
  end
end

seed
