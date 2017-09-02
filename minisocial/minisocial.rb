class Post

  attr_accessor :body

  def initialize(opts = {})
    @body = opts[:body].to_s
  end

  def nice_print
    puts "*"*5
    puts "\t #{self.body}"
    puts "*"*5
  end

end

def create_user
  require "Faker"
  usuario = "#{Faker::Name.unique.name.scan(/[a-zA-Z]+$/)[0]}#{Faker::Internet.free_email.scan(/@[a-z]+\W[a-z]+/)[0]}"
  @users << usuario
  def thousand_posts
    1000.times do |i|
      require "Faker"
      posting = "#{Faker::Friends.quote}"
      @posts << posting
    end
  end
  thousand_posts
end

def seed
  1000.times do |i|
    create_user
  end
end

class User

  PSW_REGEX = /\A.{8}\z/
  EMAIL_REGEX = /\A\p{Alnum}+@\p{Alnum}+\.com\z/
  attr_accessor :email, :password, :nickname, :posts

  def initialize(opts = {})
    #@email = opts[:email] ? opts[:email] : raise(Exception.new("PailaMiPerro"))
    @email = opts[:email].to_s
              .scan(EMAIL_REGEX).any? ?
              opts[:email] :
              abort("PailaMiPerro eso no es un email")
    @password = opts[:password].to_s.scan(PSW_REGEX).any? ? opts[:password] : abort("PailaMiPerro eso no es un password valido")
    @nickname = opts[:nickname].to_s
    @posts = opts[:posts].is_a?(Array) ? opts[:posts] : []
  end

  # crea un Post y lo agrega al arreglo de posts
  # parameters: opts = {}. opts[:body], recibe el body del post en un hash.
  def create_post(opts = {})
    self.posts << Post.new(opts)
  end

  def authenticate(password_submitted)
    self.password == password_submitted.to_s
  end

  def nice_print_posts
    puts "-- #{self.email} --"
    self.posts.each do |post|
      post.nice_print
    end
    puts ""
  end

end

# user = User.new(
#   email: "yonga@fusepong.com",
#   password: "holaqueh",
#   nickname: "yonga"
# )
# user2 = User.new(
#   email: "camilo@fusepong.com",
#   password: "12345678",
#   nickname: "camilo"
# )
#
# user.create_post(body: "hola que hace, banderiando o que hace??")
# puts user.posts.inspect
# puts user.posts.first
# puts user.posts.first.class
# puts user.posts.first.inspect
# puts user.posts.first.body
#
# puts "authenticate #{user.nickname} with 12345678"
# puts user.authenticate "12345678"
# puts "authenticate #{user2.nickname} with 12345678"
# puts user2.authenticate "12345678"

def menu
  system("clear")
  puts '#'*60
  puts '#'*60
  puts "MINISOCIAL :)".rjust(40, '#') + '#'*20
  puts "WELCOME".rjust(35, '#') + '#'*25
  puts "_"*60
  puts ""
  puts "MENU"
  puts ""
  puts "1. Registrarse"
  puts "2. Iniciar sesion"
  puts "0. Salir"
end

def logged_in_menu
  system("clear")
  puts '#'*60
  puts '#'*60
  puts "MINISOCIAL :)".rjust(40, '#') + '#'*20
  puts "WELCOME - #{@current_user.nickname.length <= 0 ?
                    @current_user.email :
                    @current_user.nickname}"
  puts "_"*60
  puts ""
  puts "MENU"
  puts ""
  puts "1. Publique algo mi perrito"
  puts "2. Ver publicaciones"
  puts "3. Cerrar sesion"
  puts "0. Salir"
end

def sign_up
  system "clear"
  puts "Digite su correo electronico."
  email = gets.chomp
  puts "Digite su password."
  password = gets.chomp
  puts "Confirme su password."
  password_confirmation = gets.chomp
  puts "Digite su nickname."
  nickname = gets.chomp
  if password != password_confirmation
    system "clear"
    puts "Password no concide con la confirmacion, intentelo de nuevo, perrito. Presione cualquier tecla para continuar..."
    gets.chomp
    sign_up
    return
  end
  if @users[email]
    system "clear"
    puts "Ya se encuentra un usuario registrado con este email. Crea una cuenta nueva. Presione cualquier tecla para continuar..."
    gets.chomp
    sign_up
    return
  end
  @users[email] = User.new(email: email, password: password, nickname: nickname)
  @current_user = @users[email]
end

def sign_in
  system "clear"
  puts "Digite su correo electronico."
  email = gets.chomp
  puts "Digite su password"
  password  = gets.chomp
  if @users[email] and @users[email].authenticate(password)
    @current_user = @users[email]
  else
    system "clear"
    puts "email o el password incorrecto. Intente de nuevo, presione cualquier tecla para continuar..."
    gets.chomp
    return
  end
end

def logout
  system "clear"
  puts "BYE BYE BYE !!!! Presione, cualquier tecla para continuar..."
  gets.chomp
  @current_user = nil
  return
end

def publish
  system "clear"
  puts "Escriba a ver...."
  body = gets.chomp
  if body.length <= 0
    system "clear"
    puts "Tu publicacion debe tener contenido!!!!!. Presiona cualquier tecla para continuar"
    gets.chomp
    publish
    return
  end
  @current_user.create_post(body: body)
  puts "Le quedo linda la pendejada."
  gets.chomp
end

def feed
  system "clear"
  puts "FEED "
  puts ""
  @users.each do |email,user|
    user.nice_print_posts
  end
  gets.chomp
end

@input = nil
@users = {}
@users["yonga@email.com"] = User.new(
    email: "yonga@email.com",
    password: "password",
    nickname: "yonga"
)
@current_user = nil
while @input != 0 do
  if @current_user
    logged_in_menu
    case @input
    when 1 then publish
    when 2 then feed
    when 3 then logout
    end
  else
    menu
    case @input
    when 1 then sign_up
    when 2 then sign_in
    end
  end
  @current_user ? logged_in_menu : menu
  @input = gets.chomp.to_i
end



#
