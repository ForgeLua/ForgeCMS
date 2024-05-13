function HexToRgba(hex, opacity)
  local hexRegex = "^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$"
  if not string.match(hex, hexRegex) then
      return ''
  end
  hex = string.gsub(hex, '#', '')
  local r, g, b
  if #hex == 3 then
      r = tonumber(string.sub(hex, 1, 1) .. string.sub(hex, 1, 1), 16)
      g = tonumber(string.sub(hex, 2, 2) .. string.sub(hex, 2, 2), 16)
      b = tonumber(string.sub(hex, 3, 3) .. string.sub(hex, 3, 3), 16)
  else
      r = tonumber(string.sub(hex, 1, 2), 16)
      g = tonumber(string.sub(hex, 3, 4), 16)
      b = tonumber(string.sub(hex, 5, 6), 16)
  end
  return string.format("rgba(%d, %d, %d, %s)", r, g, b, opacity)
end

return {
  HexToRgba = HexToRgba,
}