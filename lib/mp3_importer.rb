require 'pry'

class MP3Importer

  attr_accessor :path

  #@@path_directory = []

  def initialize(path)
    @path = path
  end


  # You should write code that responds to MP3Importer.new('./db/mp3s').import.
  # Google around for how to get a list of files in a directory!
  # Make sure you only get .mp3 files.
  def files
    path_items = Dir.entries(@path) # returns an array of items
    path_items.select do |element|
      element.include?(".mp3")
    end
    # Dir["/path/to/search/**/*.rb"]
    #binding.pry

  end

  def import
     files.each do |file|
       artist_name = file.split(" - ")[0]
       artist = Artist.find_or_create_by_name(artist_name)
       artist.songs << Song.new_by_filename(file)
     end
 end
end
