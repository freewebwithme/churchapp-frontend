const String getChurch = """
  query(\$uuid: String) {
    getChurch(uuid: \$uuid) {
      id
      name
      intro
      channelId
      slideImageOne
      slideImageTwo
      slideImageThree
      latestVideos {
        id
        title
        description
        videoId
        thumbnailUrl
        publishedAt
        channelTitle
      }
    }
  }
""";

const String PLAYLISTITEMS = """
query(\$playlistId: String, \$nextPageToken: String) {
  playlistItems(playlistId: \$playlistId, nextPageToken: \$nextPageToken) {
    nextPageToken
    items {
      id
      title
      description
      videoId
      publishedAt
      thumbnailUrl
      channelTitle
    }
  }
}
""";

const String ALL_PLAYLISTS = """
query(\$channelId: String) {
  playlists(channelId: \$channelId) {
    id
    playlistId
    playlistTitle
    description
    thumbnailUrl
  }
}
""";
