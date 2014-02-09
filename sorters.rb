# a collection of sort functions
class Sorters

  # assuming user_list is an array of users
  # 
  # you can sort by first name (using the method below)
  # like this
  # 
  # user_list.sort(&Sorters.by_firstname)
  # 
  # This is equivalent to 
  #
  # user_list.sort_by(&:firstname)
  def self.by_firstname
    Proc.new do |item1,item2|
      item1.firstname <=> item2.firstname
    end
  end

  # assuming user_list is an array of users
  # 
  # you can sort by first name (using the method below)
  # like this
  # 
  # user_list.sort(&Sorters.by_firstname)
  # 
  # This is equivalent to 
  #
  # user_list.sort_by(&:firstname)
  def self.by_lastname
    Proc.new do |item1,item2|
      item1.lastname <=> item2.lastname
    end
  end

  def self.by_lastname_then_firstname
    Proc.new do |item1, item2|
      result = by_lastname.call(item1, item2)
      if (result == 0)
        # last names are the same
        result = by_firstname.call(item1, item2)
      end
      result
    end
  end

end
