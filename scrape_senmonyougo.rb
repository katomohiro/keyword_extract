require 'open-uri'
require 'nokogiri'

# loop1----
url = "https://www.google.co.jp/"

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# 検索ワードのgoogle検索結果をスクレイピングして上位10位のURLを取得

# loop1 ----end

# 専門用語抽出サービスにGETで送信
url = "http://gensen.dl.itc.u-tokyo.ac.jp/gensenweb.html"

# loop2-----
# 取得したURLをパラメーターにいれて送信
params(:url) = ""
# 抽出結果を取得
# loop2 ----end

