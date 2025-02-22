class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @@all << self
  end
    @@all = []
    
  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1]
    song = Song.new(song)
    song.artist_name = artist
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
end
