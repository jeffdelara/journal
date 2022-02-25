require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "create a category" do
    user = User.first 
    category = user.categories.build name: 'New test category'    
    
    assert category.valid?
    assert_equal category.name, 'New test category'
  end

  test "create a task" do 
    user = User.first 
    category = user.categories.create name: 'New test category'
    new_category = 
      category.tasks.create(
        title: 'This is a new task', 
        description: 'A new description.', 
        due: DateTime.now, 
        user: user
      )

    assert new_category.valid?
    assert_equal new_category.title, "This is a new task"
  end


end
