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
  include mysql
  include redis
  include imagemagick
  include phantomjs

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

  $home = "/Users/${::boxen_user}"
  $work = "${home}/work"
  $my   = "${home}/my"

  file {
    $work:
      ensure => directory;
    $my:
      ensure => directory;
  }

  repository { "${work}/tuntun":
    source => "hanachin/tuntun",
    require => File[$work]
  }

  repository { "${my}/hanachin.github.io":
    source => "hanachin/hanachin.github.io",
    require => File[$my]
  }

  repository { "${my}/dotfiles":
    source => "hanachin/dotfiles",
    require => File[$my]
  }

  repository { "${work}/snapwhim":
    source => "yasulab/snapwhim",
    require => File[$work]
  }

  repository { "${work}/snapwhim-chef":
    source => "hanachin/snapwhim-chef",
    require => File[$work]
  }

  repository { "${work}/ssslimer":
    source => "hanachin/ssslimer",
    require => File[$work]
  }
}
