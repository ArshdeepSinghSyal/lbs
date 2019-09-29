module UsersHelper
  def isAdmin()
    if Usertype.find(current_user.usertype) == "admin"
      true
    else
      false
    end
  end
  def isLibrarian
    Usertype.find(current_user.usertype) == "librarian"
  end
  def isStudent
    Usertype.find(current_user.usertype) == "studentPhD" || Usertype.find(current_user.usertype) == "studentG" || Usertype.find(current_user.usertype) == "studentUG"
  end
end
