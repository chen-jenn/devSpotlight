class AnnouncementsController < ApplicationController

  require 'news-api'

  def index
    @newsapi = News.new('c5d28ab09641461793d60c537e0a0466')
    @all_articles = @newsapi.get_everything(q: 'bitcoin',
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
