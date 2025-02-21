class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs


    def song_names_by_genre(genre_object)
        a = self.songs.select { |song| song.genres.include? genre_object }
        a.map(&:name)
    end

    def slug
        slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        Artist.all.find { |artist| artist.slug == slug }
    end
end