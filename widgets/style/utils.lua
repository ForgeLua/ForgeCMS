local Intents = require('widgets.style.intents')
local sass = require('sass')

function CompileSCSSWithVariables()
  local scss = io.open('styles/default.scss'):read('*all')

  local modifed_scss = string.format([[
    $color_1: #ebdec2;
    $color_2: #fff;
    $color_3: #f7b10a;
    $color_4: #ffd36b;
    $color_5: white;
    $color_6: #5792d5;
    $font-family_1: Open Sans, Arial, Helvetica, sans-serif;
    $font-family_2: Semplicita Pro,Open Sans,Arial,Helvetica,sans-serif;
    $font-family_3: opensans,sans-serif;
    $transparent: transparent;
    
    // Intents
    %s

    // SCSS
    %s
  ]], Intents.GetIntents(), scss)

  return sass.compile_data(modifed_scss)
end

return {
  CompileSCSSWithVariables = CompileSCSSWithVariables,
}