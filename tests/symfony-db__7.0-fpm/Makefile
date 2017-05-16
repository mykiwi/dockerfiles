FIG = docker-compose

test:
	$(FIG) up -d > /dev/null
	$(FIG) run --rm php php test.php > log && basename $PWD | sed -En "s/__/:/p" | sed -En "s/(.*)/tests mykiwi\/\1 OK/p" || (cat log && false)

clean:
	$(FIG) kill
	$(FIG) rm --force
	rm -f log
