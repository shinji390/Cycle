module ApplicationHelper

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

  # 改行表示
  def br(str)
    html_escape(str).gsub(/\r\n|\r|\n/, '').html_safe
  end

  # gravatar
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar rounded-circle")
  end

  # 投稿時間
  def simple_time(time)
    time.strftime("%Y-%m-%d  %H:%M  ")
  end

  # コンテンツ中のyoutubeURL
  def yotube_url_delete(url)
    new_content = url.content.gsub(/https:\/\/www.youtube.com\/watch\?v=(.+)/, "")
    content_tag(:p, new_content, class: 'contents')
  end

  def index_postcontent_slice(post)
    content = post.content.gsub(/https:\/\/www.youtube.com\/watch\?v=(.+)/, "")
    new_content = content.slice(0..300)
    new_content.length > 300 ? new_content + '...' : new_content
    content_tag(:p, new_content, class: 'contents')
  end

  # youtube
  def thumbnail_youtube(post)
    if post.url.match(/https:\/\/www.youtube.com\/watch\?v=(.+)/)
      new_url = post.url.gsub('https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/')
      iframe = content_tag(
        :iframe,
        '',
        src: "#{new_url}",
        frameborder: 0,
        allowfullscreen: true
      )
      content_tag(:div, iframe, class: 'card-img-top embed-responsive-item')
    elsif post.text.match(/https:\/\/www.youtube.com\/watch\?v=(.+)/)
      new_url = post.url.gsub('https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/')
      iframe = content_tag(
        :iframe,
        '',
        src: "#{new_url}",
        frameborder: 0,
        allowfullscreen: true
      )
      content_tag(:div, iframe, class: 'card-img-top embed-responsive-item')
    end
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
