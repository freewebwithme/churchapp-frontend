const String getChurch = """
  query(\$uuid: String) {
    getChurch(uuid: \$uuid) {
      id
      name
      intro
      channelId
      addressLineOne
      addressLineTwo
      email
      phoneNumber
      schedules {
        serviceName
        serviceTime
        order
      }
      latestVideos {
        id
        title
        description
        videoId
        thumbnailUrl
        publishedAt
        channelTitle
      }
      employees {
        id
        name
        position
        profileImage
      }
      news {
        id
        content
        createdAt
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
