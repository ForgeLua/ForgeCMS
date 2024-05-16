function App()
  return string.format([[
    <main role="main" class="container">
      <% content_for("inner") %>
    </main>
  ]])
end

return App