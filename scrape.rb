require 'open-uri'
require 'nokogiri'

url = "https://www.google.co.jp/"

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
p doc.title


url = "https://www.google.co.jp/search?site=&source=hp&q=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B&oq=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B"

agent = Mechanize.new
page = agent.get(url)
elements = page.search('li a')

puts elements