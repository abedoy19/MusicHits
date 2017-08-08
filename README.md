# MusicHits 
Es una aplicación web la cual contendrá información básica de las canciones que suban diferentes usuarios. Para ser parte de la plataforma el usuario deberá tener una cuenta, una vez creada este podrá añadir una canción de su preferencia o ver las canciones que otros usuarios hayan compartido. Las canciones agregadas podrán ser actualizadas y eliminadas posteriormente por el usuario

## (Proyecto 1 Asignatura Tópicos Especiales en Telemática)
## Por Ana María Bedoya - abedoy19@eafit.edu.co

# DEVELOPMENT::

## 1. Creando la aplicación en Ruby on Rails.

        rails new musichits

## 2. Iniciando el WebApp Server.

        rails s

* Se abre el navegador: http://localhost:3000

## 3. Página principal: "Yay! You're on Ruby on Rails"

## 4. Para modificar la página principal se procede a editar la siguiente dirección:

      	app/views/welcome/index.html.erb

## 5. Para generar el controlador de la vista welcome, se escribe lo siguiente en la línea de comandos:

	rails generate controller welcome index

## 6. Las rutas REST de la aplicación pueden conocerse ejecutando el siguiente comando:     

        rake routes

* Resultado:

		 Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
           user_password PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
                         POST   /users/password(.:format)      devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
       user_registration PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                         POST   /users(.:format)               devise/registrations#create
                   songs GET    /songs(.:format)               songs#index
                         POST   /songs(.:format)               songs#create
                new_song GET    /songs/new(.:format)           songs#new
               edit_song GET    /songs/:id/edit(.:format)      songs#edit
                    song GET    /songs/:id(.:format)           songs#show
                         PATCH  /songs/:id(.:format)           songs#update
                         PUT    /songs/:id(.:format)           songs#update
                         DELETE /songs/:id(.:format)           songs#destroy
                    root GET    /                              welcome#index
          welcome_create GET    /welcome/create(.:format)      welcome#create

## 7. Controlador para los REST services de 'songs'.

        rails generate controller songs

## 8. Creando el modelo para Song.

		rails generate model Song name:string singer:string album:string genre:string state:string

## 9. Para ejecutar una migración.

    	rails db:migrate 

## 10. Instalamos postgresql en el ambiente de test y producción.

* Se debe modificar el Gemfile, el config/database.yml y luego se elimina, crea y migra la base de datos así
		
		rake db:drop db:create db:migrate


# TEST::
# 1. Despliegue de la aplicación en el DCA, Linux Centos 7.x (test)

## Se instaló Ruby on Rails con RVM siguiendo el tutorial del sitio web:
	
		https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-centos-6-with-rvm

## También se instaló el gestor de base de datos Postgres.

*Para correr postgres:

        sudo systemctl start postgresql
        sudo systemctl enable postgresql

* Crear usuario nuevo para asignarle a la base de datos musichits_test que se procederá a crear.

        sudo su - postgres

        createuser -s anabd

        psql

        \password anabd
        Enter new password: *****

        createbd database musichits_test with owner anabd

        postgres=# \q

        exit

## Configurar RAILS_ENV y PORT (3000 para desarrollo, 4000 para pruebas y 5000 para producción)

        user1@test$ export RAILS_ENV=test
        user1@test$ export PORT=4000

## Abrir puerto en el servicio firewalld:

        user1@test$ sudo firewall-cmd --zone=public --add-port=4000/tcp --permanent
        user1@test$ sudo firewall-cmd --reload

## Luego se procede a clonar el repositorio, migrar la base de datos y a correr rails s.

# Instalación de Apache Web Server en el DCA.

        sudo yum install httpd
        sudo systemctl enable httpd
        sudo systemctl start httpd

        Probamos en el navegador http://10.131.137.236

* Instalación de YARN (https://yarnpkg.com/en/docs/install) (para hacer rake assets:precompile):  

* Instalar el módulo Passenger para Rails en HTTPD (https://www.phusionpassenger.com/library/install/apache/install/oss/el7/):

        gem install passenger
        passenger-install-apache2-module

Al finalizar la instalación, agregar a /etc/http/conf/httpd.conf:

        LoadModule passenger_module /home/ana/.rvm/gems/ruby-2.4.1/gems/passenger-5.1.6/buildout/apache2/mod_passenger.so
        <IfModule mod_passenger.c>
          PassengerRoot /home/ana/.rvm/gems/ruby-2.4.1/gems/passenger-5.1.6
          PassengerDefaultRuby /home/ana/.rvm/gems/ruby-2.4.1/wrappers/ruby
        </IfModule>

* Configurar la aplicación de RoR para que use Passenger (https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/el7/deploy_app.html):




