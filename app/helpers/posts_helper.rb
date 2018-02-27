module PostsHelper

  # 改行表示
  def br(str)
    html_escape(str).gsub(/\r\n|\r|\n/, '').html_safe
  end

  # 投稿時間
  def simple_time(time)
    time.strftime("%Y-%m-%d  %H:%M  ")
  end

  # インデックス文字数スライス
  def index_postcontent_slice(post)
    new_content = post.content.slice(0..120)
    if new_content.length > 119
      "#{new_content}...."
    else
      new_content
    end
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

end
