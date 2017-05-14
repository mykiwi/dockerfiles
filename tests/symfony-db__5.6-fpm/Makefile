FIG = docker-compose

test:
	$(FIG) up -d
	$(FIG) run --rm php php test.php

clean:
	$(FIG) kill
	$(FIG) rm --force
