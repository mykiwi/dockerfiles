test:
	docker-compose up --build -d
	docker-compose exec app php test.php | grep -v "failed"

clean:
	docker-compose kill
	docker-compose rm --force
