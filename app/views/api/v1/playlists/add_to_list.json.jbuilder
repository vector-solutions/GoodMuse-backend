
json.playlist do

  json.id            @playlist.id
  json.title         @playlist.title
end

json.dj  do
  json.id            @playlist.user.id
  json.email         @playlist.user.email
end

json.songs @playlist.songs do |song|
    json.id                 song.id
    json.song_name          song.name
    json.artist_name        song.artist_name
    json.album_name         song.album
    json.tags               song.tags.pluck(:name)

end

json.success true