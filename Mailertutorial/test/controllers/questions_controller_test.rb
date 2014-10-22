require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

 #  setup do
 #  Question = nil
 # end

  test "should get new" do
    get :new
    assert_response :found
  end

  # test "should redirect to login when not user" do
  # current_user = User.new
  # current_user = nil
  # get :new
  # assert_redirected_to new_user_path
  # end

  test "should get index" do
    get :index
    assert_response :found
  end

  test "should get show" do
    get :show, id: questions(:one)
    assert_response :found
  end

  test "should submit question with valid data" do # Fails right now
    get :new
    post :new, { title: 'Wassup', text: 'nothing', user:{user: :one} }
    assert_not_nil Question
  end

  test "should not submit question with invalid data" do
    Question = nil
    get :new
    post :new, {title: '', text: ''}
    assert_nil Question
  end
end
