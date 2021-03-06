require 'pry'
class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path =  path
  end

  def files
    #Dir.chdir(@path)
    @files = Dir.glob(@path+ "/*.mp3")
    @files.collect do |f|
      f.gsub(@path+"/", "")
    end
  end

  def import
    files.each{ |filename| Song.new_by_filename(filename) }
  end
end