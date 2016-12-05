class Song

attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
   artist_name = file_name.split(" - ")[0]
   song_name = file_name.split(" - ")[1]
   song = self.new(song_name)
   song.artist = Artist.find_or_create_by_name(artist_name)
   song
 end

  # def self.formatter(file_name)
  #   new_format = filename.split(" - ")
  #   @genre = new_format[-1][0..-5]
  #   @artist = new_format[0]
  #   @name = new_format[1]
  #
  # end
end
