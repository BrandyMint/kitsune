`<%= Kitsune::Application.assets.find_asset('annyang.js').body.html_safe %>`

window.Kitsune ||= {}

$ ->

  Kitsune.options =
    rules: <%= site.rules.pluck(:phrase, :link).to_json.html_safe %>
    language: '<%= site.language.code %>'
  #sites:
  #rules:
  #
  #index:
  #  url: "/"
    commands:
      "окно": ->
        alert 'окно'

  #commands = "show tps report": ->
  #$("#tpsreport").show()
  #return

  if annyang
    #commands_list = Kitsune.options.commands_list
    options = Kitsune.options
    commands = options.commands
    #for c of commands_list
    #  console.log c
    #  commands c.commands
    #  console.log c.commands

    annyang.setLanguage options.language
    annyang.addCommands commands

    annyang.start()

  return
