module ApplicationHelper

  def safe_form
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token"
       value="#{form_authenticity_token}"       >
    HTML
  end

  def log_action

    # if current_user.nil?
    #   sign_in
    if logged_in?
      sign_out_button
    else
      sign_in_links
    end
  end

  def sign_in_links
    <<-HTML.html_safe
        <a href="#{new_session_url}">Sign in!</a>
       or
       <a href="#{new_user_url}">Sign up!</a>
    HTML
  end

  def sign_out_button
    <<-HTML.html_safe
    <form action="#{session_url}" method="POST">
      #{delete_it}
      #{safe_form}
      <button>Sign out</button>
    HTML
  end


  def post_it
    rails_method(:push)
  end

  def put_it
    rails_method(:put)
  end

  def patch_it
    rails_method(:patch)
  end

  def delete_it
    rails_method(:delete)
  end

  def rails_method(type)
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="#{type.to_s.upcase}">
    HTML
  end
end
