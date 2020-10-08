require 'faker'

User.destroy_all
User.reset_pk_sequence
Product.destroy_all
Product.reset_pk_sequence
Category.destroy_all
Category.reset_pk_sequence

Faker::Config.locale = 'fr'

user_email_array = ['aomeeladmin@yopmail.com', 'julien@yopmail.com', 'benjamin@yopmail.com', 'amaury@yopmail.com', 'benoit@yopmail.com']
category_array = ['Imparisyllabique' , 'Hétéroclite' , 'Rocambolesque' , 'Délectable' , 'Cataclysmique']
product_name_array = ['Anakin','Bellatrix','Excalibur','Galilée','Gertrude','Itachi','Ondine','Padme','Perceval','Pétunia','Pikachu','Platon','Princesse Leia','Raspoutine','Rodolphe','Roi Arthur','Sauron','Shrek','Vador','Yoda']
product_description_array = ["Obtenez l'élu de la force, il vous le rendra bien (nous ne répondrons pas de son comportement).","Tu ne seras jamais de taille à rivaliser avec moi, pauvre petit bonhomme...","Seul l'élu pourra me posséder.","Je n'ai jamais rencontré d'homme si ignorant qu'il n'eut quelque chose à m'apprendre. Achète-moi.","Comme son nom ne l'indique pas…","Quand tu posséderas la même pupille que moi… viens à moi !","J'adore l'eau, dans 20/30 ans il y en aura plus.","Ainsi s'éteint la liberté. Sous des applaudissements.","C'est pas faux.","Elle fait un peu la star mais elle est cool.","Attrapez les tous.","Les hommes ne veulent pas ce qu'ils font, mais ce en vue de quoi ils font ce qu'ils font.","Obi-wan, vous êtes mon dernier espoir.","Je me battrai pour toi… Tant que tu me paieras.","Craquez pour ce petit geek.","Il commence à doucement me faire chier celui là aussi!","Un Anneau pour les gouverner tous, un Anneau pour les amener tous et dans les ténèbres les lier.","J’te double, et je suis même pas à fond…","Rejoignez le côté obscur de la force et controllez la galaxie aux côtés de Vador le chat. Fourni avec la tasse.","M'acheter tu feras, satisfaction tu obtiendras, jeune padawan."]
product_url_array = ["https://pictures.kitties.netlib.re/storage/resized_and_compressed/Anakin.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Bellatrix.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Excalibur.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Galilee.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Gertrude.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Itachi.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Ondine.jpeg","https://pictures.kitties.netlib.re/storage/resized_and_compressed/Padme.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Perceval.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Petunia.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Pikachu.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Platon.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Leia.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Raspoutine.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Rodolphe.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/RoiArthur.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Sauron.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Schrek.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Vador.jpeg", "https://pictures.kitties.netlib.re/storage/resized_and_compressed/Yoda.jpeg"]

i = 0
2.times do
  user = User.create(
    email: user_email_array[i],
    password: 'Azerty',
    avatar: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn1.iconfinder.com%2Fdata%2Ficons%2Fui-set-6%2F100%2FQuestion_Mark-512.png&f=1&nofb=1"
  )
  i += 1
  puts "Seeding User #{user.email}"
end

User.find(1).update(is_admin: true)

i = 0
5.times do
  category = Category.create(
    name: category_array[i]
  )
  i += 1
end
i = 0
20.times do
  product = Product.create(
    name: product_name_array[i],
    description: product_description_array[i],
    price: rand(11..99),
    url: product_url_array[i],
    category_id: rand(1..5)
  )
  i += 1
end
