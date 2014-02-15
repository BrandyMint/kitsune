# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    #primary.item :hotels, I18n.t("admin.menu.hotels"), root_url

    primary.dom_class = 'nav navbar-nav pull-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true

    if user_signed_in?
      primary.item :sites, 'Сайты', sites_path
      primary.item :sing_out, 'Выйти', destroy_user_session_path, :method => :delete, :options => {:method => :delete}
    else
      primary.item :sing_in, 'Войти', new_user_session_path
    end
  end
end
