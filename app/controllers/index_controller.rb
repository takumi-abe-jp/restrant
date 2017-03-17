class IndexController < ApplicationController
  helper_method :updateShow

  def index
    @@page = params[:page]

    params = {
        keyid: @@keyid,
        format: 'json',
        latitude: @@latitude,
        longitude: @@longitude,
        range: @@range,
        hit_per_page: 12,
        offset_page: @@page
    }

    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)
  end

  def show
    id = params[:id]

    params = {
        keyid: @@keyid,
        format: 'json',
        id: id
    }
    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)
  end

end
