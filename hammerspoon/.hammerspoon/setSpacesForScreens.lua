-- this should be a no-op apart from the side-effect of resetting the dock
local function resetDock()
  local Space = SPACES.spacesByScreenUUID()[0]
  SPACES.changeToSpace(activeSpace, true)
end

-- this sets the # of SPACES for a given screen
local function setSpacesForScreen(screen, count)
  screen_Spaces = screen:spaces()
  if #screen_Spaces == count then
    return screen
  end

  screenUUID = screen:spacesUUID()

  if #screen_Spaces >= count then
    for c = #screen_Spaces, count, -1 do
      for i, space in ipairs(screen_Spaces) do
        pcall(SPACES.removeSpace, space, false)
      end
    end
    screen_Spaces = screen:spaces()
  else
    count = count - #screen_Spaces - 1
    for i = 0, count do
      a = SPACES.createSpace(screenUUID, false)
      table.insert(screen_Spaces, a)
    end
    hs.alert("Spaces have been created on the main screen. Please move them to the desired screen")
  end
  resetDock()
  return screen_Spaces
end

-- this sets the wanted number of spaces for the given screens
local function setSpacesForScreens(laptopScreen, screen1, screen2)
  hs.showError("aaaa");
  local screenCount = 1
  if screen1 ~= nil and screen2 ~= nil then
    screenCount = 3
  else
    screenCount = 2
    if screen1 == nil then screen1 = screen2 end
  end
  hs.showError(screenCount);
  local screens = {}

  if screenCount == 1 then
    table.insert(screens, setSpacesForScreen(laptopScreen, 4))
  elseif screenCount == 2 then
    table.insert(screens, setSpacesForScreen(screen1, 4))
    table.insert(screens, setSpacesForScreen(laptopScreen, 3))
  elseif screenCount == 3 then
    table.insert(screens, setSpacesForScreen(screen2, 2))
    table.insert(screens, setSpacesForScreen(screen1, 3))
    table.insert(screens, setSpacesForScreen(laptopScreen, 2))
  end
  resetDock()
  return screens

end

return setSpacesForScreen
