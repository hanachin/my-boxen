class people::hanachin {
  include chrome
  include dropbox
  include vagrant
  include iterm2::stable
  include sublime_text_3
  include sublime_text_3::package_control
  include hipchat
  include skype
  include heroku
  include rubymine
  include zsh

  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'Postgresapp':
      source => 'https://github.com/PostgresApp/PostgresApp/releases/download/9.3.1.0-alpha1/Postgres93.zip',
      provider => 'compressed_app';
    'Copy':
      source => 'https://copy.com/install/mac/Copy.dmg',
      provider => 'appdmg';
  }

  $home = "/Users/${::boxen_user}"

  sublime_text_3::package {
    'Better CoffeeScript':
      source => 'aponxi/sublime-better-coffeescript';
    'AngularJS (CoffeeScript)':
      source => 'Iristyle/Sublime-AngularJS-Coffee-Completions';
    'Codecs 33':
      source => 'seanliang/Codecs33';
    'ConvertToUTF8':
      source => 'seanliang/ConvertToUTF8';
    'sublemacspro':
      source => 'grundprinzip/sublemacspro';
    'TrailingSpaces':
      source => 'SublimeText/TrailingSpaces';
  }
}
