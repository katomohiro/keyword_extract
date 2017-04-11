class SearchesController < ApplicationController
  require 'mechanize'
  require 'nokogiri'
  require 'open-uri'
    
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.save
  end
  
  def crawl
    agent = Mechanize.new
    url = "https://www.google.co.jp/search?site=&source=hp&q=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B&oq=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B"
    page = agent.get(url)
    
    @elements = page.search('h3 a')
    # url_for_search = elements.each do |ele|
    #   ele.get_attribute(:href)
    # end
    # url_array = url_for_search.split("/url?")
    
    
  end
  
  def crawl2
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows IE 9'
    url = 'http://gensen.dl.itc.u-tokyo.ac.jp/gensenweb.html'
    page = agent.get(url)
    result = page.form_with do |f|
      f.url = 'https://www.jica.go.jp/for/join.html'
      f.Sentence = ""
      f.disp = ""
    end.submit
    @elements = result.body
    
    # form = page.forms[0]
    # language = page.form[3]
    # form.url = 'https://www.jica.go.jp/for/join.html'
    # language.lang = 5
    # result_url = agent.submit(form).uri
    # result_page = agent.get(result_url)
    # @elements = result_page.search('pre')
  end
  
  def crawl3
    agent = Mechanize.new
    url = "https://www.google.co.jp/search?site=&source=hp&q=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B&oq=%E5%9B%BD%E9%9A%9B%E5%8D%94%E5%8A%9B"
    page = agent.get(url)
    
    @elements = page.search('h3 a')
  
    url = 'http://gensen.dl.itc.u-tokyo.ac.jp/gensenweb.html'
    page = agent.get(url)
    result = page.form_with do |f|
      f.url = 'https://www.jica.go.jp/for/join.html'
      f.Sentence = ""
      f.disp = ""
    end.submit
    @elements = result.body
  end
  
  private
  
    def search_params
      params.require(:search).permit(:keywords, :search_result)
    end
    
end
