module ApplicationHelper
  def current_path
    current_page?(controller: 'home') ? root_path : admin_students_path
  end
end
