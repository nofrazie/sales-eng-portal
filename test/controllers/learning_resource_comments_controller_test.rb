require 'test_helper'

class LearningResourceCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_resource_comment = learning_resource_comments(:one)
  end

  test "should get index" do
    get learning_resource_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_learning_resource_comment_url
    assert_response :success
  end

  test "should create learning_resource_comment" do
    assert_difference('LearningResourceComment.count') do
      post learning_resource_comments_url, params: { learning_resource_comment: { body: @learning_resource_comment.body, learning_resource_id: @learning_resource_comment.learning_resource_id, user_id: @learning_resource_comment.user_id } }
    end

    assert_redirected_to learning_resource_comment_url(LearningResourceComment.last)
  end

  test "should show learning_resource_comment" do
    get learning_resource_comment_url(@learning_resource_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_resource_comment_url(@learning_resource_comment)
    assert_response :success
  end

  test "should update learning_resource_comment" do
    patch learning_resource_comment_url(@learning_resource_comment), params: { learning_resource_comment: { body: @learning_resource_comment.body, learning_resource_id: @learning_resource_comment.learning_resource_id, user_id: @learning_resource_comment.user_id } }
    assert_redirected_to learning_resource_comment_url(@learning_resource_comment)
  end

  test "should destroy learning_resource_comment" do
    assert_difference('LearningResourceComment.count', -1) do
      delete learning_resource_comment_url(@learning_resource_comment)
    end

    assert_redirected_to learning_resource_comments_url
  end
end
