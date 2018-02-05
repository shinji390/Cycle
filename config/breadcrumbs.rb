crumb :root do
  link "ホーム", root_path
end
# ユーザー
crumb :all_users do
  link '全てのユーザー', users_path
  parent :root
end

crumb :mypage do |user|
  if user.name == current_user.name
    link 'マイページ', user_path(user)
  else
    link user.name + 'さんのページ', user_path(user)
  end
  parent :all_users
end

crumb :edit_profile do |user|
  link 'プロフィール編集'
  parent :mypage, user
end

# ポスト
crumb :new_post do
  link '投稿'
  parent :root
end

crumb :edit_post do |post|
  link '編集', edit_post_path(post)
  parent :show_post, post
end

crumb :show_post do |post|
  link '詳細', post_path(post)
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
