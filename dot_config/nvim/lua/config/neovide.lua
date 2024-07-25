local vfx_mode = {
  "railgun",
  "torpedo",
  "pixiedust",
  "snoicboom",
  "ripple",
  "wireframe",
}
local function choice(t)
  local len = #t
  local idx = math.random(len + 1)
  return vfx_mode[idx]
end
local settings = {}
settings["neovide_config"] = {
  no_idle = true,
  refresh_rate = 60,
  cursor_vfx_mode = choice(vfx_mode),
  cursor_vfx_opacity = 200.0,
  cursor_antialiasing = true,
  cursor_trail_length = 0.05,
  cursor_animation_length = 0.03,
  cursor_vfx_particle_speed = 20.0,
  cursor_vfx_particle_density = 5.0,
  cursor_vfx_particle_lifetime = 1.2,
  scale_factor = 1.0,
  hide_mouse_when_typing = true,
  remember_window_size = false,
  -- fullscreen = true,
}
return settings
