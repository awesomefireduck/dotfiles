

-- layoutname = { screenname = { spaceN = {Appname = { position='', borders=bool }}}}
singlemonitorLayout = {
  laptopScreen={
    space1={
      Mattermost={
        position='third-center', borders=true
      },["Telegram Desktop"]={
        position='third-left', borders=true
      },
    },space2={
      Spotify={
        position='fullscreen', borders=true
      },
    },space3={
      Safari={
        position='fullscreen', borders=true
      },
    },
  }
}


tripleMonitorLayout = {
  laptopScreen = {
    space1={
      Mattermost={position='third-center', borders=true},
      ["Telegram Desktop"]={position='third-left', borders=true},
      Adium={position='third-right', borders=true},
    },
    space2= {
    },
  },
  dell1Screen = {
    space1 = {
      ["Google Chrome"] = {position='fullscreen', borders=true},
    },
    space2 = {
      Safari = {position='fullscreen', borders=true},
    }
  },
  dell2Screen = {
    space1 = {
      Mail = {position='right', borders=true},
      Calendar = {position='left', borders=true},
    },
    space2 = {
      iTerm2 = {position='fullscreen', borders=false},
    },
    space3 = {
      Spotify = {position='fullscreen', borders=true},
    },
  },
}
