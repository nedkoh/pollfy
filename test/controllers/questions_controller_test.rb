require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { answer: @question.answer, created_at: @question.created_at, definition: @question.definition, desc: @question.desc, order: @question.order, page: @question.page, require: @question.require, survey_id: @question.survey_id, title: @question.title, type: @question.type, updated_at: @question.updated_at, user_id: @question.user_id, validate: @question.validate }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { answer: @question.answer, created_at: @question.created_at, definition: @question.definition, desc: @question.desc, order: @question.order, page: @question.page, require: @question.require, survey_id: @question.survey_id, title: @question.title, type: @question.type, updated_at: @question.updated_at, user_id: @question.user_id, validate: @question.validate }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
