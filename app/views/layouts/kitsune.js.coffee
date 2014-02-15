`<%= Kitsune::Application.assets.find_asset('annyang.js').body.html_safe %>`

window.Kitsune ||= {}

$ ->
  Kitsune.options =
    commands: <%= site.rules.pluck(:phrase, :link).to_json.html_safe %>
    language: '<%= site.language.code %>'
    button: '[role="kitsune-button"]'

  commands = Kitsune.options.commands
  console.log(commands)
  console.log(Kitsune.options.language)
  anyang_commands =
    'привет': ->
      gotoURL('hi')
    'пока': ->
      gotoURL('bye')
#  for c in commands
#
#    anyang_commands[c[0]] = ->
#      alert(c[1])
#      gotoURL(c[1])

  gotoURL = (url) ->
    alert(url)
  #    window.location.href = url

  Kitsune.anyang_commands = anyang_commands
  console.log Kitsune.anyang_commands

  annyang.setLanguage Kitsune.options.language
  annyang.addCommands anyang_commands

#  unless Kitsune.options.button?
#    style = "position: absolute; padding: 10px; font-size: 16px; background: #d9534f;"
#    $('body').append("<div class='kitsune-button' role='kitsune-app-button' style='#{style}'>K!</div>")
#    Kitsune.options.button = "[role='kitsune-app-button']"

#  $(Kitsune.options.button).on 'click', () ->
  annyang.start()


