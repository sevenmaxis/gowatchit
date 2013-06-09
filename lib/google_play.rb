require 'open-uri'
require 'uri'
require 'openssl'
require 'nokogiri'

class GooglePlay

  class << self

    def proxy
      @proxy ||= URI.parse("http://71.188.63.88:3128")
    end

    def proxy=(proxy)
      @proxy = URI.parse(proxy)
    end

    def url(query)
      URI.parse("https://play.google.com/store/search?&q=#{URI.escape(query)}&c=movies")
    end

    def search(query)
      options = {:proxy => proxy, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE}
      doc = Nokogiri::HTML(open(url(query), options))
      
      { :href => doc.css(".results-section .title").first[:href],
        :price => doc.css("span.buy-button-price").first.content }
    end
  end
end