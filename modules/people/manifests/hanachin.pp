class people::hanachin {
  include chrome
  include dropbox
  include vagrant

  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
  }

  $home = "/Users/${::boxen_user}"
}
