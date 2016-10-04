require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(file)
    file_arr = file.split(" - ")
    song = self.new
    song.name = file_arr[1].gsub(".mp3", "")
    song.artist_name = file_arr[0]
    song
  end

  def self.create_from_filename(file)
    file_arr = file.split(" - ")
    song = self.new
    song.name = file_arr[1].gsub(".mp3", "")
    song.artist_name = file_arr[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
