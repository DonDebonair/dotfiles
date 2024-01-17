module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: [
        "zoom.us/j/*",
        finicky.matchDomains(/.*\.zoom.us\/j/),
        /zoom.us\/j\//,
      ],
      browser: "us.zoom.xos"
    },
    {
      match: /^https?:\/\/www\.notion\.so\/sourceagriculture\/.*$/,
      browser: "Notion"
    },
    {
      match: "open.spotify.com/*",
      browser: "Spotify"
    },
    {
      match: "miro.com/app/*",
      browser: "Miro"
    }
  ]
}
