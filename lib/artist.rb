require "pry"

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all 
        @@all 
    end
    # This instance method receives an instance of a `Song` and associates it belongs to
    # _this_ `Artist` instance.

    def add_song(song)
        song.artist= self

 end

 def songs 
    Song.all.select {|song| song.artist == self}
 end

 def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.new(name)
    
 end

 def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each {|song| puts song.name}



 end

end


