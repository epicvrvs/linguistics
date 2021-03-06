require 'www-library/RequestManager'
require 'www-library/RequestHandler'

require 'application/LinguisticsSiteGenerator'
class LinguisticsSite
  attr_reader :mainHandler, :generator, :requestManager

  def initialize
    @requestManager = WWWLib::RequestManager.new
    @mainHandler = WWWLib::RequestHandler.new('linguistics')
    @requestManager.addHandler(@mainHandler)
    @generator = LinguisticsSiteGenerator.new(self, @requestManager)
    base = 'linguistics'
    @generator.addStylesheet(getStylesheet(base))
  end

  def getStaticPath(base, path)
    return @mainHandler.getPath(*(['static', base] + path))
  end

  def getStylesheet(name)
    getStaticPath('style', [name + '.css'])
  end

  def getIcon(name)
    getStaticPath('icon', [name + '.ico'])
  end
end
