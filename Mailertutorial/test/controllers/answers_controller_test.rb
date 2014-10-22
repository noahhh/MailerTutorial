require 'test_helper'

class AnswersControllerTest < ActionController::TestCase

  should "redirect to login when invalid user" do
    @current_user = nil
    get :new
    assert_redirected_to new_login_path
  end

  should "let user create answer when logged in" do # Doesn't work yet
    current_user = User.new( name: "noah", email: "noah@noah.com", password: "password", password_confirmation: "password")
    get :new
    post :new, { text: "wassup", user: current_user, question: "wassup"}
    assert_redirected_to answers_path
  end
end
