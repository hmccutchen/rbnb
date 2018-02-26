Geocoder.configure(
  lookup: :google,
  api_key:   ENV['GOOGLE_API_SERVER_KEY'],
  use_https: true,           # use HTTPS for lookup requests? (if supported)
  units: :km,
  distances: :linear
)
