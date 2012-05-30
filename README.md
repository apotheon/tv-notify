## TV Notify

TV Notify notifies you about your favorite upcomming programs. It queries
a provider of your choice for the upcomming listings in your area.

Currently, the supported providers are.

  - LocateTV

## Requirements

The only real requirement is Ruby 1.9.1 or higher. To install the required
gems, just run the `bundle` command. The following gems are installed.

  - Libnotify
  - Nokogiri
  - Chronic

You should **not** install these gems manually. There are some other gems
that need to be installed for them to work. And some gems are installed
from their Git source.

## Usage

TV Notify uses a YAML configuration file. An example configuration file is
as follows.

    # The TV Show
    show: How I Met Your Mother

    # The TV Provider (See above list.)
    provider: LocateTV

    # The time within the show to display the notifications (in seconds.)
    time: 600

Note that a configuration file **is required** for TV Notify. One you have,
your configuration file you can run TV Notify as follows.

    ruby /path/to/tv-notify.rb /path/to/config.yml

## Contributing A Provider

If LocateTV does not work for you, you can write your own provider and tie
it in. Your provider should be similar to the LocateTV provider, located in
`lib/tv-notify/locatetv.rb`.

While your provider does not need to implement the same methods as the
LocateTV provider; it does need to implement the `get_show_listings` method.

Once you have your provider, stop. Don't do anything else and open a pull
request with the TV Notify repository. We will configure the rest. But thanks
for making a provider for us.

## Contact

You can contact me [through Github][1] or by email. Thanks for using TV Notify!

  Bryan Dunsmore  
  dunsmoreb@gmail.com

  [1]: https://github.com/dunsmoreb
