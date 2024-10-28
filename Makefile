DOCKER_EXEC = docker compose exec app

.PHONY: start stop bash cc migrate quality update trans perm db reload composer-install logs test

start: ## Start the application and Docker services
	docker compose up --build -d

stop: ## Stop the application and Docker services
	docker compose down

bash: ## SSH into PHP container
	$(DOCKER_EXEC) bash

cc: ## Clear the cache
	$(DOCKER_EXEC) php bin/console cache:clear

migrate: ## Run migrations
	$(DOCKER_EXEC) php bin/console doctrine:migrations:migrate -n

quality: ## Run quality checks
	$(DOCKER_EXEC) composer quality

update: ## Update dependencies
	$(DOCKER_EXEC) composer update -W

trans: ## Dump translations
	$(DOCKER_EXEC) composer dump-trans

perm: ## Set permissions
	$(DOCKER_EXEC) chown -R www-data:www-data var

db: ## Reset the database and load fixtures
	$(DOCKER_EXEC) php bin/console doctrine:database:drop --force
	$(DOCKER_EXEC) php bin/console doctrine:database:create
	$(DOCKER_EXEC) php bin/console doctrine:migrations:migrate -n
	$(DOCKER_EXEC) php bin/console doctrine:fixtures:load -n

reload: ## Restart services and clear cache
	make stop
	make start
	make cc

composer-install: ## Run composer install
	$(DOCKER_EXEC) composer install

logs: ## Show logs for services
	docker compose logs -f

test: ## Run PHPUnit tests
	$(DOCKER_EXEC) php bin/phpunit
