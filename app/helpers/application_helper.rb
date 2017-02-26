module ApplicationHelper
end

def cp(path)
  "current" if current_page?(path)
end

def current_user
	session[:user_id] ? User.find(session[:user_id]) : nil
end

def current_user_id
	session[:user_id]
end