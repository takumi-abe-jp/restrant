class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @@keyid     = "a6fe695fd03809023efa81072abccf3b"
  @@url       = "https://api.gnavi.co.jp/RestSearchAPI/20150630/"
  @@latitude = ''
  @@longitude = ''
  @@range = ''
  @@page = 1
end
