class AnnouncementsController < ApplicationController

  require 'news-api'

  def index
    @newsapi = News.new('9f5c53248fdd4c768aa4ce30b2f6eeb4')
    @all_articles = @newsapi.get_everything(q: 'Web development',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2018-04-01',
                                      to: '2018-04-25',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 1)

    @announcements = Announcement.order(created: :desc)
  end

end
