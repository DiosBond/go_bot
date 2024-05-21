#####	INSTALL
# sudo apt-get install build-essential
# make for windows	https://gnuwin32.sourceforge.net/packages/make.htm
# !!! work for me https://sourceforge.net/projects/mingw/files/
# In the next step, go to the “C” drive, open up the “MinGW” folder, and find the “mingw-get.exe” file. Copy the file location as shown below;
# Search for “Environment Variables” in the “Startup” menu and open it;
# From the “System Variables” panel, select the given “Path”, and click on the “Edit” button;
# After that, press the “New” button and paste the copied path inside the Path field. Then, hit the “Ok” button;
# open CMD from administrator;
# and install mingw-get install mingw32-make;
# check it - mingw32-make --version;
# After that, open the “bin” folder and locate the “mingw32-make.exe” file. Rename the file name as “make.exe”
#####

#####	USE
# make (if file named Makefile)
# make -f [myfile] (for same name file)

APP := go_bot
#$(shell basename $(shell git remote get-url origin))
##### Same docker-registry for images
REGISTRY := github.com/diosdond

##### OS
TARGETOS=linux #windows #linux darwin windows

##### Architecktureadd
TARGETARCH=amd64 #amd64 arm64

##### Version
VERSION=v1.0.0
#$(shell git describe --tags --abbrev=0 --tags)-$(shell git rev-parse --short HEAD)

format:
	gofmt -s -w ./

lint:
	golint

#test:
#	go test -v

get:
	go get

#build: format get
#CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} not work for windows
#	 CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-crchitecture}  go build -v -o kbot -ldflags "-X="https://github.com/DiosBond/go-bot/cmd.appVersion=${VERSION}

build: format get
#CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-crchitecture} not work for windows
#	 CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="https://github.com/DiosBond/go_bot/cmd.appVersion=${VERSION}"

	 CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="https://github.com/DiosBond/go_bot/cmd.appVersion=${VERSION}

image:
# docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} --build-arg TARGETARCH=${TARGETARCH}
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} --build-arg TARGETARCH=${TARGETARCH}
#	 --build-arg TARGETARCH=${TARGETARCH}

push:
# docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}


clean:
#rm -rf kbotbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
