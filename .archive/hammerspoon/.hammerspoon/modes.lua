w_mode = hs.hotkey.modal.new({"alt"}, "w", "mode w triggered")

-- escape key
w_mode:bind({}, 53, "escape pressed", nil, function() w_mode:exit(); end, nil)

w_mode:bind({}, "i", nil, function()
  hs.hints.windowHints();
  w_mode:exit();
end, nil, nil)


function bindWindowMovement()

  w_mode:bind({"shift", "alt"}, "h", "h pressed", function()
    local win = hs.window.focusedWindow();
    win:moveOneScreenWest(false, true);
    w_mode:exit();
  end, nil)

  w_mode:bind({"shift", "alt"}, "l", "l pressed", function()
    local win = hs.window.focusedWindow();
    win:moveOneScreenEast(false, true);
    w_mode:exit();
  end, nil)

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
    w_mode:bind({}, key, nil, function() moveWindow(position, true); w_mode:exit(); end, nil, nil)
    w_mode:bind({"shift"}, key, nil, function() moveWindow(position, false); w_mode:exit(); end, nil, nil)
  end

end


function bindMonitorSwitch()

    w_mode:bind({"cmd"}, "h", nil, function()
--      local win = hs.window.focusedWindow()
--      win:focusWindowWest()
--      return

      local currentscreen = hs.screen.mainScreen()
      local nextscreen = currentscreen:toWest():id()
      local filter = hs.window.filter.new()
      filter:setScreens(nextscreen)
      windows = filter:getWindows(hs.window.filter.sortByFocusedLast)
      windows[0]:focus()
      w_mode:exit()
    end, nil, nil)
    w_mode:bind({"cmd"}, "l", function()
      hs.alert.show("11111")
      local currentscreen = hs.screen.mainScreen()
      hs.alert.show("22222")
      local nextscreen = currentscreen:toEast():id()
      hs.alert.show("33333")
      local filter = hs.window.filter.new()
      hs.alert.show("44444")
      filter:setScreens(nextscreen)
      hs.alert.show("55555")
      windows = filter:getWindows(hs.window.filter.sortByFocusedLast)
      var_dump(windows)
      hs.alert.show("66666")
      windows[0]:focus()
      hs.alert.show("77777")
      w_mode:exit()
      hs.alert.show("88888")
    end)
end



bindWithAndWithoutBorders()
bindWindowMovement()
--bindSpacesSwitch()
bindMonitorSwitch()
