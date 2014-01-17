class people::hanachin {
  # my dev tools
  include chrome
  include heroku

  include zsh
  include pow
  include vagrant
  include iterm2::dev
  include sublime_text_3
  include sublime_text_3::package_control
  include rubymine
  include gitx::dev

  include mysql
  include redis
  include imagemagick

  # communication tools
  include dropbox
  include hipchat
  include skype

  # for headless browsers
  include phantomjs
  include qt

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
    'CotEditor':
      source => 'http://sourceforge.jp/frs/redir.php?f=%2Fcoteditor%2F54872%2FCotEditor_1.3.1.dmg',
      provider => 'appdmg';
    'Google Voice and Video':
      source => "https://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg",
      provider => pkgdmg;
  }

  package { 'lv':; 'tig':; }

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

  # todo require nodejs
  exec { "sh -c 'source /opt/boxen/env.sh && nodenv global v0.10'":
    user => $::boxen_user;
  }

  # todo require ruby
  exec { "sh -c 'source /opt/boxen/env.sh && rbenv global 2.1.0'":
    user => $::boxen_user;
  }

  phantomjs::version { '1.9.2': }
  # todo require phantomjs
  exec { "sh -c 'source /opt/boxen/env.sh && phantomenv global 1.9.2'":
    user => $::boxen_user;
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
