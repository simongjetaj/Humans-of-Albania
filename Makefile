all: docker-build

docker-build:
	docker-compose down -v
	docker-compose build --no-cache
	docker-compose up -d
	sleep 5s
	@echo Application successfully built!
	@echo Type localhost:1111 into your favourite web browser.
