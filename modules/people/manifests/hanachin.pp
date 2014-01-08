class people::hanachin {
  include chrome
  include dropbox
  include vagrant

  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'Postgresapp':
      source => 'https://github.com/PostgresApp/PostgresApp/releases/download/9.3.1.0-alpha1/Postgres93.zip',
      provider => 'compressed_app';
  }

  $home = "/Users/${::boxen_user}"
}
