# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    dict = {}
    info = Album.find_by_sql(["
      SELECT
        albums.title, COUNT(*) AS num_tracks
      FROM
        albums
      JOIN
        tracks ON albums.id = tracks.album_id
      WHERE
        albums.artist_id = ?
      GROUP BY
        albums.title
      ORDER BY
        COUNT(*) DESC
    ", self.id])
    info.each { |obj| dict[obj.title] = obj.num_tracks }
    dict
  end
end
