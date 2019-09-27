# Finished code for the "Class Methods and Self" lesson

class Song
  attr_reader :title, :artist, :filename, :play_count

  # Initialize our total play count
  # This will be set to 0 when the program is loaded
  @@total_plays = 0

  def initialize(title, artist, filename)
    @title = title
    @artist = artist
    @filename = filename
    @play_count = 0
  end

  def summary
    return "#{@title}, by #{@artist}"
  end

  def play
    @play_count += 1
    @@total_plays += 1
    # ... load the song data from the file and send it to the speakers ...
  end

  def self.total_plays
    return @@total_plays
  end

  def self.most_played(song_list)
    most_played = song_list[0]
    song_list.each do |song|
      if song.play_count > most_played.play_count
        most_played = song
      end
    end
    return most_played
  end
end

s1 = Song.new("Respect", "Aretha Franklin", "songs/respect.mp3")
s2 = Song.new("What a Little Moonlight Can Do", "Billie Holiday", "songs/moonlight.mp3")
s3 = Song.new("Adore", "Savages", "songs/adore.mp3")

3.times do
  s1.play
end

5.times do
  s2.play
end

2.times do
  s3.play
end

top_song = Song.most_played([s1, s2, s3])
puts top_song.summary
