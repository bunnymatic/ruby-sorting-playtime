class User

  attr_accessor :firstname, :lastname, :login

  def initialize(firstname, lastname, login)
    @firstname = firstname
    @lastname = lastname
    @login = login
  end

end

