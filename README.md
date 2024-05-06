# go_bot
tg bot on go

### requirements
gopkg.in/telebot.v3
github.com/spf13/cobra@latest

- generate project: cobra-cli init

- create tg bot: CobraTeleGoBot

- add version cli
- add kbot

- add token:
$Env:Foo = 'An example'



read -s TELE_TOKEN
[token]
save

- check token output
echo $TELE_TOKEN

$Env:TELE_TOKEN

[Environment]::SetEnvironmentVariable('TELE_TOKEN', $Env:TELE_TOKEN)
[System.Environment]::SetEnvironmentVariable('ResourceGroup','AZ_Resource_Group')

### run go run
go run main.go