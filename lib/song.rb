class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    new_song = self.find_by_name(song_name)
    if new_song != nil
      new_song
    else
      new_song = self.create_by_name(song_name)
      new_song
    end
  end

  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    song_artist = filename_array[0]
    song_name = filename_array[1].split(".")[0]
    new_song = self.new
    new_song.artist_name = song_artist
    new_song.name = song_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end
end
