init:
	docker build --no-cache -t yukatayu_honkit_env -f Dockerfile .

start:
	docker run -v $(CURDIR)/gitbook:/documents --name honkit-daemon --rm -h honkit-daemon -p 4000:4000 -d yukatayu_honkit_env serve

stop:
	docker stop honkit-daemon

build:
	docker run -v $(CURDIR)/gitbook:/documents --rm -h honkit yukatayu_honkit_env build

pdf:
	docker run -v $(CURDIR)/gitbook:/documents --rm -h honkit yukatayu_honkit_env pdf

