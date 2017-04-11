local log = hs.logger.new('keybinds','debug')
--var_dump(hs.keycodes.map)

hs.hotkey.bind({"alt"}, "I", function()
  hs.hints.windowHints()
end)


function bindWindowMovement()

  hs.hotkey.bind({"alt"}, "Q", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest(false, true)
  end)

  hs.hotkey.bind({"alt"}, "E", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast(false, true)
  end)

end

-- binds the combination of Alt+letter to the position with borders and
-- binds the combination of Alt+Shift+letter to the position without borders
function bindWithAndWithoutBorders()
  function moveWindow(position, borders)
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    resizeWindowInScreen(win, screen, position, borders)
  end

  keybinds = {
    H= 'left',
    J= 'bottom',
    K= 'top',
    L= 'right',
    F= 'fullscreen',
    A= 'third-left',
    O= 'third-center',
    E= 'third-right',
    B= 'top-left',
    M= 'bottom-left',
    W= 'bottom-right',
    V= 'top-right',
  }

  for key, position in pairs(keybinds) do
    hs.hotkey.bind({"alt"}, key, function()
      moveWindow(position, true)
    end)
    hs.hotkey.bind({"alt", "shift"}, key, function()
      moveWindow(position, false)
    end)
  end

end


function bindMonitorSwitch()

    hs.hotkey.bind({"alt"}, "G", function()
--      local win = hs.window.focusedWindow()
--      win:focusWindowWest()
--      return

      local currentscreen = hs.screen.mainScreen()
      local nextscreen = currentscreen:toWest():id()
      local filter = hs.window.filter.new()
      filter:setScreens(nextscreen)
      windows = filter:getWindows(hs.window.filter.sortByFocusedLast)
      windows[1]:focus()
    end)
    hs.hotkey.bind({"alt"}, "C", function()
--      local win = hs.window.focusedWindow()
--      win:focusWindowEast()
--      return

      local currentscreen = hs.screen.mainScreen()
      local nextscreen = currentscreen:toEast():id()
      local filter = hs.window.filter.new()
      filter:setScreens(nextscreen)
      windows = filter:getWindows(hs.window.filter.sortByFocusedLast)
      windows[1]:focus()
    end)
end




bindWithAndWithoutBorders()
bindWindowMovement()
--bindSpacesSwitch()
bindMonitorSwitch()
