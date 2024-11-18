MODE = plaintext-single

up:
	sudo docker compose -f docker-compose.$(MODE).yml up -d --renew-anon-volumes

down:
	sudo docker compose -f docker-compose.$(MODE).yml rm -fsv && \
	sudo docker compose -f docker-compose.$(MODE).yml down --remove-orphans
	
start:
	sudo docker compose start

stop:
	sudo docker compose stop