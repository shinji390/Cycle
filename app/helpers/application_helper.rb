module ApplicationHelper
include PostsHelper
include UsersHelper

  # エラーメッセージ
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg mb-0">・#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

  # ページタイトル
  def page_title(title = '')
    base_title = 'Cycle'
    title.empty? ? base_title : title + '|' + base_title
  end

  # current_page
  def current_page(url)
    if url == '/'
      'current'
    elsif url == '/posts'
      'current'
    end
  end

end
