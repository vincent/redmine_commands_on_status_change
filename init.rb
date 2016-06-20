require 'redmine'
require_dependency 'custom_field_change'

Redmine::Plugin.register :redmine_commands_on_status_change do
  name 'Redmine Command On Issues Changes '
  author 'Vincent Lark'
  description 'When changing an issue status to "Tested", automatically make an HTTP request'
  version '1.0'

  requires_redmine :version_or_higher => '2.5.x,2.4.x,2.3.x,2.2.x'
end
