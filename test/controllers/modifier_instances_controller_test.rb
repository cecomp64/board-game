require 'test_helper'

class ModifierInstancesControllerTest < ActionController::TestCase
  setup do
    @modifier_instance = modifier_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modifier_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modifier_instance" do
    assert_difference('ModifierInstance.count') do
      post :create, modifier_instance: { character: @modifier_instance.character, character_id: @modifier_instance.character_id, geography_id: @modifier_instance.geography_id, modifier_id: @modifier_instance.modifier_id, space_id: @modifier_instance.space_id }
    end

    assert_redirected_to modifier_instance_path(assigns(:modifier_instance))
  end

  test "should show modifier_instance" do
    get :show, id: @modifier_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modifier_instance
    assert_response :success
  end

  test "should update modifier_instance" do
    patch :update, id: @modifier_instance, modifier_instance: { character: @modifier_instance.character, character_id: @modifier_instance.character_id, geography_id: @modifier_instance.geography_id, modifier_id: @modifier_instance.modifier_id, space_id: @modifier_instance.space_id }
    assert_redirected_to modifier_instance_path(assigns(:modifier_instance))
  end

  test "should destroy modifier_instance" do
    assert_difference('ModifierInstance.count', -1) do
      delete :destroy, id: @modifier_instance
    end

    assert_redirected_to modifier_instances_path
  end
end
