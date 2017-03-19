class IndexController < ApplicationController

  def index
    res_back = @res
    @@page = params[:page]

    #検索がおされたら位置情報をいれる
    if params[:commit] == '検索' then
      getLocation
    end

    @range = @@range

    params = {
        keyid: @@keyid,
        format: 'json',
        latitude: @@latitude,
        longitude: @@longitude,
        range: @@range,
        hit_per_page: @@per_page,
        offset_page: @@page
    }
    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)

    setForm
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

    setForm
  end

  def getLocation
    @@latitude = params[:latitude]
    @@longitude = params[:longitude]
    @@range = params[:range]
    @@page = 1
  end

  def setForm
    @latitude = @@latitude
    @longitude = @@longitude
  end
end
