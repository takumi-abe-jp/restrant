class IndexController < ApplicationController
  def index
    params = {
        keyid: @@keyid,
        format: 'json',
        latitude: @@latitude,
        longitude: @@longitude,
        range: @@range,
        hit_per_page: 12
    }

    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)

    #todo 別の一覧ページを作ってそこをindexで表示させる。表示させる内容は/0/1/2のようにurlにページ番号
    items = "..."
    item_total = @res['total_hit_count']
    #@items = Kaminari.paginate_array(items, total_count: item_total).page(params[:page]).per(12)

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

  def _show
    params = {
        keyid: @@keyid,
        format: 'json',
        offset_page: @page
    }
    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)
  end

  def get_info
    @page = params[:page]
    params = {
        keyid: @@keyid,
        format: 'json',
        offset_page: @page
    }
    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)
  end

end
