build-prod:
	docker compose -f docker-compose.prod.yml build

push-prod:
	docker compose -f docker-compose.prod.yml push

up-deploy:
	docker compose -f docker-compose.deploy.yml up -d