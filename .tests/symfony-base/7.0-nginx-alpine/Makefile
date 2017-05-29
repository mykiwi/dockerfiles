test:
	docker-compose up --build -d
	docker-compose exec app touch file-with-good-permission
	rm -f file-with-good-permission

clean:
	docker-compose kill
	docker-compose rm --force
	docker rmi test
