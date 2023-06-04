module UsersHelper
  def display_user(submission)
    submission.user.nil? ? link_to("Add User", edit_submission_path(submission)) : link_to(submission.user_username, user_path(submission.user))
  end
end
