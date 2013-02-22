require 'test_helper'

class UnitToolsControllerTest < ActionController::TestCase
  setup do
    @unit_tool = unit_tools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_tool" do
    assert_difference('UnitTool.count') do
      post :create, unit_tool: { path: @unit_tool.path, tool_id: @unit_tool.tool_id, unit_id: @unit_tool.unit_id }
    end

    assert_redirected_to unit_tool_path(assigns(:unit_tool))
  end

  test "should show unit_tool" do
    get :show, id: @unit_tool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_tool
    assert_response :success
  end

  test "should update unit_tool" do
    put :update, id: @unit_tool, unit_tool: { path: @unit_tool.path, tool_id: @unit_tool.tool_id, unit_id: @unit_tool.unit_id }
    assert_redirected_to unit_tool_path(assigns(:unit_tool))
  end

  test "should destroy unit_tool" do
    assert_difference('UnitTool.count', -1) do
      delete :destroy, id: @unit_tool
    end

    assert_redirected_to unit_tools_path
  end
end
