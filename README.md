# GobanSlack

GobanSlack is a Slack integration for [Goban](http://goban.co/), a web app that allows you to edit Go boards online and share it with friends.

## Installation

1. First of all, deploy this app to Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

2. Once the app is deployed, add the **Slash Commands** integration on your Slack team and configure it as follows:

* Command: the command name you want to use to create a new Go game. The recommended command name to use is `/goban`.
* URL: should point to the `/boards` endpoint on the URL of your deployed Heroku app.
* Method: leave it as "POST".

3. Finally, add the Incoming WebHooks integration on your Slack team. This is needed so that GobanSlack can post messages to your Slack team's channels.

Copy the `WebHook URL` value and use it as the value of the `SLACK_URL` variable on your Heroku app's environment.

That's it!

## Using it

Write `/goban` in any Slack channel and GobanSlack will create an empty Go board at [Goban](http://goban.co) and will post the link to the new board in the same channel so that anyone on that channel can see the board and/or play.

## Credits

[Goban](http://goban.co) was created and is maintained by [Lucas Nasif](http://lucasnasif.com).
GobanSlack was created by [Matías Flores](http://matflores.com).

## License

Distributed under the terms of the MIT license.
See bundled [LICENSE](https://github.com/matflores/goban-slack/blob/master/LICENSE)
file for more info.
