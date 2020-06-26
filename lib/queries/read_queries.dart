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
      website
      active
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
query(\$churchId: String, \$playlistId: String, \$nextPageToken: String) {
  playlistItems(churchId: \$churchId, playlistId: \$playlistId, nextPageToken: \$nextPageToken) {
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

const String GET_LIVE_STREAMING = """
query(\$channelId: String!) {
  getLiveStreaming(channelId: \$channelId) {
    id
    items {
      title
      description
      videoId
      publishedAt
      channelTitle
      thumbnailUrl
    }
  }
}
""";
