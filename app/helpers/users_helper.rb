module UsersHelper

  def findUserNameWithPost(comment)
    User.find_by(:id => comment.user_id).name
  end



end
