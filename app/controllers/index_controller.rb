class IndexController < ApplicationController
  def index


    params = {
        keyid: @@keyid,
        format: 'json',
        latitude: @@latitude,
        longitude: @@longitude,
        range: @@range
    }

    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)

    #todo 別の一覧ページを作ってそこをindexで表示させる。表示させる内容は/0/1/2のようにurlにページ番号
    items = "..."
    item_total = @res['total_hit_count']
    #@items = Kaminari.paginate_array(items, total_count: item_total).page(params[:page]).per(10)

  end

  #todo idをもらってそのidのurlを開く、その時idのapi情報を@resで持ってくる
  def show
    @id = params[:id]

    params = {
        keyid: @@keyid,
        format: 'json',
        id: @id
    }
    result = open("#{@@url}?#{URI.encode_www_form(params)}")
    @res = JSON.parse(result.read)

    #render :text => "id = #{params[:id]}"
  end
end
