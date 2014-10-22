require 'test_helper'

class LoginsControllerTest < ActionController::TestCase

  def setup
    @user = User.new
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should fail login with invalid password" do
    get :new
      post :new, session: { email: @user.email, password: '' }
      assert_template :new
  end

  test "should fail login with invalid email" do
    get :new
      post :new, session: { email: '', password: 'Password' }
      assert_template :new
  end

  test "should login with valid information" do
  get :new
    post :new, session: { email: @user.email, password: 'password' }
    if User.count == 1
    assert_redirected_to @user
    end
  end

  context "DELETE logins#destroy" do
    setup { delete :destroy, {}, current_user_id: users(:one).id  }

    should "redirect to home" do
      assert_redirected_to root_path
    end

    should "log out" do
      assert_nil session[:current_user_id]
    end
  end

end
