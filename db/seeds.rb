Category.delete_all
Product.delete_all

services = Category.create(name: "Services", 
													 parent_id: nil )
  
  hourly_rate = Category.create(name: "Hourly Rates", parent_id: services.id )
    
    regular_hours = Product.create(name: "Regular Hours", 
    															 price: 30.00, 
    															 description: "Standard Business hours are from 8-6 pm Monday - Saturday", 
    															 category_id: hourly_rate.id)

    emergency_hours = Product.create(name: "Emergency Hours", 
    																 price: 40.00, 
    																 description: "Emergency Hours are anytime that is not a business hour. Rates are $40 and up (depending on location).", 
    																 category_id: hourly_rate.id)

  lockouts = Category.create(name: "Lockouts", 
  													 parent_id: services.id )

    regular_lockouts = Product.create(name: "Lockout - Regular hours",
  																	price: 30.00,
  																	description: "$30 and up depending on location",
  																	category_id: lockouts.id)

    emergency_lockouts = Product.create(name: "Lockout - Emergency hours",
  																	price: 40.00,
  																	description: "$40 and up depending on location",
  																	category_id: lockouts.id)

  deadbolts = Category.create(name: "Deadbolt Installation", 
  													 parent_id: services.id )

	  standard_deadbolt = Product.create(name: "Standard Deadbolt",
  																	price: 15.00,
  																	description: "Holes drilled and deadbolt installed $15 (If customer provides deadbolt)",
  																	category_id: deadbolts.id)    

	  standard_deadbolt_provided = Product.create(name: "Standard Deadbolt (Generic Deadbolts Provided)",
  																	price: 25.00,
  																	description: "Holes drilled and deadbolt installed $25 (Generic deadbolt provided)",
  																	category_id: deadbolts.id)   

	  repinning_deadbolts = Product.create(name: "Repinning Deadbolts",
  																	price: 10.00,
  																	description: "Re pinning of deadbolt s or handles to match hosme $10 per deadbolt or handle",
  																	category_id: deadbolts.id)   

	  electronic_keypad_deabolts = Product.create(name: "Electronic Keypad Deadbolts ",
  																	price: 15.00,
  																	description: "$15 fee for installation with customer providing keypad (door with precut holes) Price of keypad installation depends on style",
  																	category_id: deadbolts.id) 

  rekeys = Category.create(name: "Re-keys", 
  												 parent_id: services.id )

 		standard_rekeys = Product.create(name: "Standard Rekeys",
  																	price: 30.00,
  																	description: "$30 and up depending on location. Standard or Emergency hours apply ",
  																	category_id: rekeys.id)

# Products
#   Locks
#   Deadbolts
#   Electronic Keypad Deadbolts

products = Category.create(name: "Products", parent_id: nil )

  locks = Category.create(name: "Locks", 
                          parent_id: products.id)

    schlage = Product.create(name: "Schlage",
                             price: nil,
                             description: "For over 85 years Schlage has provided homeowners with innovative quality security products.",
                             category_id: locks.id )


    kwikset = Product.create(name: "Kwikset",
                             price: nil,
                             description: "Offers Smart Keys and much more",
                             category_id: locks.id )

    kwikset = Product.create(name: "Weiser",
                             price: nil,
                             description: "Technological innovation that provides superior security ",
                             category_id: locks.id )

    emtek = Product.create(name: "EMtek",
                           price: nil,
                           description: "EMtek Description",
                           category_id: locks.id )

    yale = Product.create(name: "Yale",
                          price: nil,
                          description: "Yale Description",
                          category_id: locks.id )

    keys = Category.create(name: "Keys", parent_id: products.id)

    commercial = Product.create(name: "Commercial Keys", price: 3.00, 
      description: "The price varies depending on the type of key", category_id: keys.id)

    standard = Product.create(name: "Standard Keys", price: 2.00, 
      description: "Most house keys are Standard Keys", category_id: keys.id)

    custom = Product.create(name: "Custom Keys", price: 4.00, 
      description: "Most house keys are Standard Keys", category_id: keys.id)




MonthlyPost.delete_all

monthlypost = MonthlyPost.create(:body => "Jensen Locksmithing is proud to sa the launch of their website. Jensen Locksmithing was Established in the Southern Utah area in early 2008, and are longtime residents of Washington County.
  
This site is completely customisable, allowing us to create and edit the content so check back regularly! 

We have a [Frequently Asked Question](frequently_asked_questions) section, [Coupons and Discounts](discounts_coupons), feel free to browse around!")


#Monthly Posts Spanish
monthlytranslation = monthlypost.translations.create(:body => "Cerrajeria Jensen se enorgullece en anunciar el lanzamiento de su sitio web. Cerrajeria Jensen se establecio en el area del sur de Utah, a principios de 2008, y son los residentes mas antiguos del Condado de Washington.
   Este sitio es completamente personalizable, lo que nos permite crear y editar el contenido a fin de comprobar regularmente! Tenemos una seccion de Preguntas Frecuentes, cupones y descuentos, sientase libre de navegar alrededor!",
		  :locale => "es" )


#Coupons
Coupon.delete_all

coupon1 = Coupon.create(:name => "Refer A Friend",
          :description => "If you refer a friend you will receive 10% of their total bill towards any key or lock products. For Example: If they spend $100 you get $10 Just make sure they tell us you referred them!!",
          :expiration => (rand*10).days.ago )

coupon2 = Coupon.create(:name => "Receive a 20% discount on any Home or Auto Lockout.",
          :description => " We know you never actually plan one of these, so don't worry about printing this coupon off. Just remember you saw it and give us a call when the \"Uh Oh!\" moment happens and we will give you the 20% discount. This can be the silver lining to your cloud!",
          :expiration => (rand*10).days.ago )


#FAQ
Faq.delete_all

faq1 = Faq.create(:question => "Can I have my house locks keyed to the same key?",
          :answer => "Yes. If all the keyways are the same brand it is much simplier
The most frequently used home keyway styles are kwikset and Schlage.
Each have their advantages. We will be glad to talk with you about your
options and let you choose the one that is best for you.",
          :position => 1 )

        faq1translation = faq1.translations.create(:question => "Puedo tener mi casa bloqueos de la forma adecuada para la misma clave?",
		  :answer => "Si. Si todos los chaveteros son la misma marca es mucho mas sencillo Los estilos de casas de uso mas frecuente del chavetero son Kwikset y Schlage. Cada uno tiene sus ventajas. Estaremos encantados de hablar con usted acerca de su opciones y usted puede elegir la que es mejor para usted.",
		  :locale => "es" )


faq2 = Faq.create(:question => "I have been thinking about getting a keyless entry, what are the advantages?",
          :answer => "There are several advantages to having a keyless entry. They allow entry by
family members or those you want to have access to your home without
giving them keys. Most keyless entries can be reprogrammed easily. It is a
safeguard against being locked out of your home. They are more affordable now
than they have been in the past. Most can be installed in exsisting deadbolt
openings.",
          :position => 2 )

    faq2translation = faq2.translations.create(:question => "He estado pensando en conseguir una entrada sin llave, cuales son las ventajas?",
		  :answer => "Hay varias ventajas de tener una entrada sin llave. Permiten la entrada de miembros de la familia o los que quieren tener acceso a su casa sin dandoles llaves. La mayoria de las entradas sin llave puede ser reprogramado facilmente. Es una proteger en contra de ser excluido de su hogar. Son mas asequibles ahora lo que han sido en el pasado. La mayoria se pueden instalar en exsisting cerrojo aberturas.",
		  :locale => "es" )

faq3 = Faq.create(:question => "I am having issues with my locks and handles, should I repair them or replace them?",
          :answer => "If you have expensive brands of locks and handles it can be worthwhile
to have them repaired rather than replacing them with the exact brand.
 Expensive brands don't necessesarily mean best durability. The best thing
is to have a qualified lock technition help determine the cause and
at that point  decide the best solution.  (see Special Discount off on this website)",
          :position => 3 )

     faq3translation = faq3.translations.create(:question => "Estoy teniendo problemas con mis cabellos y las manijas, debo repararlos o reemplazarlos?",
		  :answer => "Si usted tiene marcas caras de las cerraduras y se encarga de que puede valer la pena para pedir su reparacion en lugar de reemplazarlas con la marca exacta. Marcas caras no significa necessesarily mejor durabilidad. Lo mejor es contar con una ayuda de bloqueo technition calificado determine la causa y en ese punto decidir la mejor solucion. (vease el descuento especial en este sitio)",
          :locale => "es" )

Contact.delete_all

contact_us = Contact.create(
							:phone => "(435)669-4637",
							:email => "jensenlocksmith@gmail.com",
							:facebook => "http://www.facebook.com",
							:twitter => "http://www.twitter.com",
							:review => "http://www.google.com")

PageHeader.delete_all

home = PageHeader.create(page: 1,
  title: "About Us",
  description: "Jensen Locksmithing is dedicated to serving Southern Utah Communities locksmithing needs. Established in 2008, Jensen Locksmithing is the premier locksmith in Southern Utah."
    )

  hometranslation = home.translations.create(
   title: "Acerca de Jensen Cerrajeria",
   description: "Cerrajeria Jensen se dedica a servir a comunidades del sur de Utah cerrajeria necesidades. Establecida en 2008, Jensen Cerrajeria es el cerrajero de primera clase en el sur de Utah.",
   locale: "es"
   )

  services = PageHeader.create( :page  => 2,
              :title => "Products & Services",
              :description => "Jensen Locksmithing is committed to helping you with all your Commercial and Residential locksmith needs."
              )

    services.translations.create(:title => "Acerca de Jensen Cerrajeria",
                                 :description => "Cerrajeria Jensen se dedica a servir a comunidades del sur de Utah cerrajeria necesidades. Establecida en 2008, Jensen Cerrajeria es el cerrajero de primera clase en el sur de Utah.",
                                 :locale => "es" )

  faq = PageHeader.create( :page  => 3,
            :title => "Frequently Asked Questions",
            :description => "Here we have the most frequently asked questions we hear. Have more questions? Feel free to contact us at (435)669-4637!"
            )

    faq.translations.create(:title => "Preguntas mas frecuentes",
                            :description => "Aqui tenemos las preguntas mas frecuentes que escuchamos. Tienes mas preguntas? No dude en contactar con nosotros en (435)669-4637!",
                            :locale => "es" )

  discounts = PageHeader.create( :page  => 4,
            :title => "Discounts & Coupons",
            :description => "Here at Jensen Locksmithing we love good deals as much as you do. Check back here frequently for new deals."
            )

    discounts.translations.create(:title => "Descuentos y Cupones",
                                  :description => "Aqui en Cerrajeria Jensen amamos buenas ofertas tanto como usted lo hace. Vuelve aqui con frecuencia de nuevos acuerdos.",
                                  :locale => "es" )

  contact_us = PageHeader.create(:page  => 5,
                                 :title => "Contact Us",
                                 :description => "Need a locksmith, or have some questions? Feel free to contact us! Also, a bid may be requested over phone at (435)669-4637, or through the 'request a bid link' above."
            )

    contact_us.translations.create(:title => "Contacte con nosotros",
                                   :description => "Necesita un cerrajero, o tiene alguna pregunta? No dude en contactar con nosotros! Por otra parte, una oferta puede ser solicitada por telefono al (435)669-4637, oa traves de los de arriba la peticion de un enlace de oferta.",
                                   :locale => "es" )

Review.delete_all

review1 = Review.create(:first_name  => "Richard",
						:last_name => "Miller",
						:body => "Phil really helped me out of a bind. I had two storm doors that didn't have locks, he came right when I needed him and still left my wallet intact with their discounts! I would highly recommend them to anyone.",
            active: true
						)
	review1translation = review1.translations.create(:body=> "Cerrajeria Jensen me ayudo a salir de un aprieto. Tenia dos puertas de tormenta que no tenian cerraduras, que llego justo cuando yo lo necesitaba y aun asi deje mi cartera intacta! Yo les recomendaria a cualquier persona en el area del sur de Utah, las manos hacia abajo.",
						:locale => "es"
            )

review2 = Review.create(:first_name  => "Stuart",
						:last_name => "Clove",
						:body => "Very great and friendly service! I love that this is a family ran business, you can tell they actually care about there customers. Thanks guys!",
            :active => true
						)

	review2translation = review2.translations.create( :locale => "es",
						:body => "Que gran servicio! Nunca he estado mas impresionado con la rapidez con que fueron capaces de salir de aqui. Un servicio +."
						)

review3 = Review.create( :first_name  => "Scott",
						:last_name => "Cooper",
						:body => "Thanks for the fast service. It's nice knowing that if I get locked out at any hour, you guys are here to help.",
            active: true
						)

	review3translation = review3.translations.create( :locale => "es",
						:body => "Rapidez en el servicio impresionante para cualquier persona! Yo recomendaria a cualquiera."
						)

Logo.delete_all

logo = Logo.create!(:name => "Standard Logo",
					:image => File.open(File.join(Rails.root, 'app/assets/images/logo.png')),
					:default => true
					)

User.delete_all

user = User.create!(:email => "soccerchase@gmail.com",
					:password => "chaskins182",
					:password_confirmation => "chaskins182"
					)