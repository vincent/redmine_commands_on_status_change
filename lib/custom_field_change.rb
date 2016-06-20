require 'net/http'

module RedmineCommandIssueStatusChange
  class CustomFieldChange < Redmine::Hook::ViewListener

    def controller_issues_edit_after_save(context = { })
      self.update_field(context)
    end

    def update_field(context)
        @issue = context[:issue]

      uri = URI.parse("url")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new("/hooks/issue-changed")
      request.add_field('Content-Type', 'application/json')
      request.body = URI.encode_www_form({'issue_id' => @issue.id, 'status' => @issue.status.name})
      response = http.request(request)
    end
  end
end
