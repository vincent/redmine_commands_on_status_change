require 'net/http'
require 'json'

module RedmineCommandIssueStatusChange
  class CustomFieldChange < Redmine::Hook::ViewListener

    def controller_issues_edit_after_save(context = { })
      self.update_field(context)
    end

    def update_field(context)
        @issue = context[:issue]

      uri = URI.parse("http://amv8-qa.cloudapp.net:7878")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new("/hooks/issue-changed")
      request.add_field('Content-Type', 'application/json')
      request.body = {'credentials' => {'username' => JSON.encode(@issue) }}
      response = http.request(request)
    end
  end
end

