### Rails, Nginx with Docker-compose

This application contain basic CRUD operation in rails entire application
will be containerized with docker-compose. application contain 3 images
1. Rails server running on PUMA
2. Nginx
3. Databse


### Installation

STEP 1 : insatll docker on your OS:

* https://docs.docker.com/engine/install/

STEP 2 : insatll docker-compose on your OS:

* https://docs.docker.com/compose/install/

STEP 3 : clone this project in your project directory

STEP 4: Build this project
```
docker-compose build
```
STEP 5: Run application
```
docker-compose up
```
STEP 6: Run application

check http://localhost in your broswer

###### For Databse creation
```
docker-compose run app rails db:create
```
###### For migration
```
docker-compose run app rails db:migrate
```

###### For rails model or controller generation
```
docker-compose run app rails g #{model_name}
docker-compose run app rails g controller #{controller_name}
```










