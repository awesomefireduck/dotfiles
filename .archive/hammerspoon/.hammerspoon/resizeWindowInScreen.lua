local function resizeWindowInScreen(win, screen, position, borders)
  local max = screen:frame()
  local f = win:frame()
  local b_top = 0
  local b_bottom = 0
  local b_left = 0
  local b_right = 0
  local w_sep_horiz = 0
  local w_sep_vert = 0

  if (borders) then
    b_top = max.h * border_top
    b_bottom = max.h * border_bottom
    b_left = max.w * border_left
    b_right = max.w * border_right
    w_sep_horiz = max.w * window_separation_horizontal
    w_sep_vert = max.w * window_separation_vertical
  end

  if (position == 'fullscreen') then
    f.x = max.x + b_left
    f.y = max.y + b_top -- border of 5%
    f.w = max.w - b_right - b_left
    f.h = max.h - b_top - b_bottom
  elseif position == 'left' then
    f.x = max.x + b_left
    f.y = max.y + b_top
    f.w = max.w / 2 - b_left - w_sep_horiz
    f.h = max.h - b_top - b_bottom
  elseif position == 'right' then
    f.x = max.x + (max.w / 2) + w_sep_horiz
    f.y = max.y + b_top
    f.w = max.w / 2 - b_right - w_sep_horiz
    f.h = max.h - b_top - b_bottom
  elseif position == 'top' then
    f.x = max.x + b_left
    f.y = max.y + b_top
    f.w = max.w - b_right - b_left
    f.h = max.h / 2 - w_sep_vert - b_top
  elseif position == 'bottom' then
    f.x = max.x + b_left
    f.y = max.h /2  + w_sep_vert
    f.w = max.w - b_right - b_left
    f.h = max.h / 2 - b_bottom 
  elseif position == 'third-right' then
    f.x = max.x + (max.w / 3)*2 + w_sep_horiz
    f.y = max.y + b_top
    f.w = max.w / 3 - b_right - w_sep_horiz
    f.h = max.h - b_top - b_bottom
  elseif position == 'third-left' then
    f.x = max.x + b_left
    f.y = max.y + b_top
    f.w = (max.w / 3) - b_left - w_sep_horiz
    f.h = max.h - b_top - b_bottom
  elseif position == 'third-center' then
    f.x = max.x + (max.w / 3) + w_sep_horiz
    f.y = max.y + b_top
    f.w = (max.w / 3) - w_sep_horiz*2
    f.h = max.h - b_top - b_bottom
  elseif position == 'top-left' then
    f.x = max.x
    f.y = max.y
    f.w = (max.w/2)
    f.h = (max.h/2)
  elseif position == 'bottom-left' then
    f.x = max.x
    f.y = max.y + (max.h/2)
    f.w = (max.w/2)
    f.h = (max.h/2)
  elseif position == 'top-right' then
    f.x = max.x + (max.w/2)
    f.y = max.y
    f.w = (max.w/2)
    f.h = (max.h/2)
  elseif position == 'bottom-right' then
    f.x = max.x + (max.w/2)
    f.y = max.y + (max.h/2)
    f.w = (max.w/2)
    f.h = (max.h/2)
  else
    return
  end
  win:setFrame(f)
end
return resizeWindowInScreen
