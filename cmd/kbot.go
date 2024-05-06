/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/spf13/cobra"
	telebot "gopkg.in/telebot.v3"
)

var (
	//TELE TOKEN
	TeleToken = os.Getenv("TELE_TOKEN")
)

// kbotCmd represents the kbot command
var kbotCmd = &cobra.Command{
	Use:     "kbot",
	Aliases: []string{"start"},
	Short:   "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("kbot called", TeleToken)
		kbot, err := telebot.NewBot(telebot.Settings{
			URL:    "",
			Token:  TeleToken,
			Poller: &telebot.LongPoller{Timeout: 10 * time.Second},

			// // Updates channel capacity, defaulted to 100.
			// Updates int

			// // Poller is the provider of Updates.
			// Poller Poller

			// // Synchronous prevents handlers from running in parallel.
			// // It makes ProcessUpdate return after the handler is finished.
			// Synchronous bool

			// // Verbose forces bot to log all upcoming requests.
			// // Use for debugging purposes only.
			// Verbose bool

			// // ParseMode used to set default parse mode of all sent messages.
			// // It attaches to every send, edit or whatever method. You also
			// // will be able to override the default mode by passing a new one.
			// ParseMode ParseMode

			// // OnError is a callback function that will get called on errors
			// // resulted from the handler. It is used as post-middleware function.
			// // Notice that context can be nil.
			// OnError func(error, Context)

			// // HTTP Client used to make requests to telegram api
			// Client *http.Client

			// // Offline allows to create a bot without network for testing purposes.
			// Offline bool
		})

		if err != nil {
			log.Fatal("Error: /n", err)
			return
		}

		kbot.Handle(telebot.OnText, func(mes telebot.Context) error {
			log.Print(mes.Message().Payload, mes.Text())
			return err

		})
	},
}

func init() {
	rootCmd.AddCommand(kbotCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// kbotCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// kbotCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
