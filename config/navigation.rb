# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'
  navigation.name_generator = Proc.new {|name_and_icon, item| 
      name, icon = name_and_icon.split('|')
      icon = 'no-icon' if icon.blank?
      "<i class='fa fa-#{icon}'></i><span>#{name}</span>".html_safe }

  # Define the primary navigation
  navigation.items do |primary|
    primary.dom_id = 'nav'
    primary.dom_class = 'nav ng-scope'

    if user_signed_in? && current_user.is_admin?
      primary.item :dashboard, 'Dashboard|dashboard', root_path
      primary.item :dashboard, 'Locations|locations', '#'
     
      primary.item :system, 'System|cog', '', :class => 'has-sub' do |system|
          system.item :users, 'Users', '#'
          system.item :roles, 'Roles', '#'
          system.item :stats, 'Stats', '#'
          system.item :backup_logs, "Backup Logs", '#'
          system.item :authentication_logs, "Authentication Logs", '#'
      end

    end 

  end 


end
