require 'test_helper'

class ReviewRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_reply = review_replies(:one)
  end

  test "should get index" do
    get review_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_review_reply_url
    assert_response :success
  end

  test "should create review_reply" do
    assert_difference('ReviewReply.count') do
      post review_replies_url, params: { review_reply: { comment: @review_reply.comment, review_id: @review_reply.review_id } }
    end

    assert_redirected_to review_reply_url(ReviewReply.last)
  end

  test "should show review_reply" do
    get review_reply_url(@review_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_reply_url(@review_reply)
    assert_response :success
  end

  test "should update review_reply" do
    patch review_reply_url(@review_reply), params: { review_reply: { comment: @review_reply.comment, review_id: @review_reply.review_id } }
    assert_redirected_to review_reply_url(@review_reply)
  end

  test "should destroy review_reply" do
    assert_difference('ReviewReply.count', -1) do
      delete review_reply_url(@review_reply)
    end

    assert_redirected_to review_replies_url
  end
end
