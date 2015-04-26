class people::hanachin {
  # my dev tools
  include chrome
  include firefox
  include heroku

  include zsh
  include pow
  include vagrant
  include iterm2::dev
  include sublime_text_3
  include sublime_text_3::package_control
  include rubymine
  include gitx::dev
  include virtualbox

  include mysql
  include redis
  include imagemagick
  include xquartz
  include inkscape

  # communication tools
  include dropbox
  include hipchat
  include skype

  # for headless browsers
  include phantomjs
  include qt

  # n
  include java

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
    'Kobito':
      source => "http://kobito.qiita.com/download/Kobito_v1.8.7.zip",
      provider => 'compressed_app';
    'Butter':
      source => "https://github.com/harukasan/butter/releases/download/v0.1.4/Butter_0.1.4.dmg",
      provider => 'appdmg';
  }

  include homebrew
  homebrew::tap { 'homebrew/binary': }

  package { 'gradle':; 'lv':; 'tig':; 'docker':; 'emacs':; 'boot2docker':; 'chromedriver':; 'readline':; 'tree':; 'ag':; 'casperjs':; }

  # boxenでの構築でハマった所メモ
  # http://qiita.com/kibitan/items/103dcdd32f0b22731487
  # readlineの接続先直す | iii ThreeTreesLight
  # http://threetreeslight.com/post/58786169382/readline
  exec{ "replace_readline_of_ruby" :
   command => "find /opt/boxen/rbenv -name readline.bundle -exec install_name_tool -change /usr/lib/libedit.3.dylib `find /opt/boxen -name libreadline.dylib` {} \\;",
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
    'SublimeLinter':
      source => 'SublimeLinter/SublimeLinter3';
    'SublimeLinter-ruby':
      source => 'SublimeLinter/SublimeLinter-ruby';
    'BeautifyRuby':
      source => 'CraigWilliams/BeautifyRuby';
    'EditorConfig':
      source => 'sindresorhus/editorconfig-sublime';
    'SublimeSocket':
      source => 'sassembla/SublimeSocket3';
  }

  # todo require nodejs
  exec { "sh -c 'source /opt/boxen/env.sh && nodenv global v0.10'":
    user => $::boxen_user;
  }

  phantomjs::version { '1.9.7': }
  # todo require phantomjs
  exec { "sh -c 'source /opt/boxen/env.sh && phantomenv global 1.9.7'":
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
