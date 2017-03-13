class IndexController < ApplicationController
  def index
    keyid     = "a6fe695fd03809023efa81072abccf3b"
    url       = "https://api.gnavi.co.jp/RestSearchAPI/20150630/"
    latitude = 35.670083
    longitude = 139.763267
    range = 1

    params = {
        keyid: keyid,
        format: 'json',
        latitude: latitude,
        longitude: longitude,
        range: range
    }

    result = open("#{url}?#{URI.encode_www_form(params)}")
    result = JSON.parse(result.read)
    if result['total_hit_count'].to_i > 0 then
      @res = ''
      @res = result['total_hit_count'] + '件の結果が見つかりました。\n'
      result['rest'].size.times do |i|
        @res += result['rest'][i]['id'] + ' ' + result['rest'][i]['name'] + ' ' + result['rest'][i]['access']['line'] + ' ' + result['rest'][i]['access']['station'] + ' ' + result['rest'][i]['access']['walk'] + '分\n'
      end
    else
      @res = '検索結果が見つかりませんでした。'
    end
   end

  def show

  end
end
