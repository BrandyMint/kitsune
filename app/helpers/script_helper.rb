module ScriptHelper
  def site_rules_json site
    site.rules.pluck(:phrase, :link).to_json
  end

  def site_language site
    site.language.code
  end
end

