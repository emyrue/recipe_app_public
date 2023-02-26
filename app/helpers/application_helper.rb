module ApplicationHelper
  def generate_signout_navlink
    content ''
    if current_user
      content = '
      <li>
        <%= link_to "sign out", destroy_user_session_path, data: { turbo_method: :delete }%>
      </li>
      '
    end
    content.html_safe
  end
end
