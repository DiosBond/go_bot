# go_bot
tg bot on go

### requirements
gopkg.in/telebot.v3 (go get gopkg.in/telebot.v3)
github.com/spf13/cobra@latest

## link to bot
t.me/CobraTeleGoBot

### how make
- generate project: cobra-cli init

- create tg bot: CobraTeleGoBot

- add version cli
cobra-cli add version
- add kbot
cobra-cli add kbot

- add and check token:
$Env:TELE_TOKEN = 'token'
$Env:TELE_TOKEN

Example save variable to ENV on win 
[Environment]::SetEnvironmentVariable('TELE_TOKEN', $Env:TELE_TOKEN)
[System.Environment]::SetEnvironmentVariable('ResourceGroup','AZ_Resource_Group')


*** not work for me
read -s TELE_TOKEN
"token"
save

echo $TELE_TOKEN
***


### run go run
go run main.go

### build app
go build

### build app with versions
go build -ldflags "-X="github.com/DiosBond/go_bot/cmd.appVersion=v1.0.0

### run builded app locally
go-bot start