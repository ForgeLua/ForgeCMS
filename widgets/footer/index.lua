function Footer()
  local title = 'ForgeCMS ©'
  local year = os.date('%Y')
  return string.format([[
    <footer class="pt-3 mt-4 text-body-secondary">
      %s %s
    </footer>
  ]], title, year)
end

return Footer