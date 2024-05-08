#####	INSTALL
# sudo apt-get install build-essential
# make for windows	https://gnuwin32.sourceforge.net/packages/make.htm
#####

#####	USE
# make (if file named Makefile)
# make -f [myfile] (for same name file)

##### Same docker-registry for images
REGISTRY = registry.gitlab.local:5000/bla-bla-bla/bla-bla

##### OS
TARGETOS = windows #linux darwin windows

##### Architeckture
TARGETARCH=amd64 #amd64 arm64 

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get