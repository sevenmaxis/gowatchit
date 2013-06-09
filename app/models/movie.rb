require 'parallel'
require Rails.root.join("lib/patched_open_struct")
require Rails.root.join("lib/google_play")

class Movie

  @@attributes = [:original_name, :released, :posters, :overview]

  def self.search(query)
    TmdbMovie.find(:title => query, :expand_results => false).map do |movie|
      movie.keep_fields(*@@attributes).to_hash
    end
  end

  def self.find(imdb, title, year)
    movie, item = Parallel.map([
      lambda { TmdbMovie.find(:imdb => imdb, :expand_results => false) },
      lambda { GooglePlay.search("#{title} (#{year})") }
    ]) { |l| l.call }

    movie.keep_fields(*@@attributes).to_hash.tap do |hash|
      hash[:href]  = item[:href]
      hash[:price] = item[:price]
    end
  end
end
