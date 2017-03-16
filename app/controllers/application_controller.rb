class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @@keyid     = "a6fe695fd03809023efa81072abccf3b"
  @@url       = "https://api.gnavi.co.jp/RestSearchAPI/20150630/"
  @@latitude = 35.670083
  @@longitude = 139.763267
  @@range = 1
  @@page = 1

end
