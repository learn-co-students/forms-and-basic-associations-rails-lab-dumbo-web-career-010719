class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
    #code
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    #code
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    #code
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |c|
      if !c.empty?
        note = Note.create(content: c)
        self.notes << note
      end
    end
  end

  def note_contents
    #code
    self.notes.map{|note| note.content}
  end
end
