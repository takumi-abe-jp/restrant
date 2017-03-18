class IndexController < ApplicationController

  def index
    @@page = params[:page]

    #位置情報がなかったら検索
    if params[:commit] == '検索' then
      getLocation
    end

    #Viewで使えるように定義
    @latitude = @@latitude
    @longitude = @@longitude
    @@range = @@range
    @page = @@page

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

  def getLocation
    @@latitude = params[:latitude]
    @@longitude = params[:longitude]
    @@range = params[:range].to_i/300
    @@page = 1
  end

end
