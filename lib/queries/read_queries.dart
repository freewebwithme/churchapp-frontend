const String getChurch = """
  query(\$uuid: String) {
    getChurch(uuid: \$uuid) {
      name
      intro
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
