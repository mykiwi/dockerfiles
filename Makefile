TESTS = $(shell ls tests)

build:
	cd docker && docker-compose build > /dev/null
	cd devbox && docker-compose build > /dev/null
	cd symfony-base/5.6-fpm && docker-compose build > log || (cat log && false)
	cd symfony-base/7.0-fpm && docker-compose build > log || (cat log && false)
	cd symfony-base/7.1-fpm && docker-compose build > log || (cat log && false)
	cd symfony-db/5.6-fpm   && docker-compose build > log || (cat log && false)
	cd symfony-db/7.0-fpm   && docker-compose build > log || (cat log && false)
	cd symfony-db/7.1-fpm   && docker-compose build > log || (cat log && false)

test:
	@$(foreach dir, $(TESTS), cd tests/$(dir); make test; make clean; cd -)
