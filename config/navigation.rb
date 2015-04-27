# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'

  # 2015-04-26 JRutherford
  # Custom name generator hack to support bootstrap theme (SB Admin 2.0)
  # with a font-awesome icon and a 
  navigation.name_generator = Proc.new { |name_and_icon_and_sub, item| 
    name, icon, has_sub = name_and_icon_and_sub.split('|')
    icon = 'no-icon' if icon.blank?
    sub_icon = '<span class="fa arrow"></span>'.html_safe if has_sub.present?
    "<i class='fa fa-#{icon} fa-fw'></i>#{name}#{sub_icon}".html_safe 
  }

  # Define the primary navigation
  navigation.items do |primary|
    primary.dom_id = 'side-menu'
    primary.dom_class = 'nav'

    if user_signed_in? && current_user.is_admin?
      primary.item :dashboard, 'Dashboard|dashboard', root_path
      primary.item :dashboard, 'Locations|map-marker', '#locations'
      primary.item :dashboard, 'App Sessions|compass', '#app-sessions'
      primary.item :dashboard, 'API Health|heartbeat', '#api-health'
     
      primary.item :system, 'System|cog|has-sub', '#system', html: {class: 'has-sub'} do |system|
        system.dom_class = 'nav nav-second-level'
        system.item :users, 'Users|user', '#users'
        system.item :roles, 'Roles|group', '#roles'
        system.item :stats, 'Stats|area-chart', '#stats'
        system.item :backup_logs, "Backup Logs|archive", '#backups'
        system.item :authentication_logs, "Authentication Logs|edit", '#auth-logs'
      end
    end 
  end 
end