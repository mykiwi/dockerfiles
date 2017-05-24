test:
	docker build -t test . > log && basename $PWD | sed -En "s/__/:/p" | sed -En "s/(.*)/tests mykiwi\/\1 OK/p" || (cat log && false)

clean:
	docker rmi test
	rm -f log
