require 'test_helper'

class MetiersControllerTest < ActionController::TestCase
  setup do
    @metier = metiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metier" do
    assert_difference('Metier.count') do
      post :create, metier: { name: @metier.name }
    end

    assert_redirected_to metier_path(assigns(:metier))
  end

  test "should show metier" do
    get :show, id: @metier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metier
    assert_response :success
  end

  test "should update metier" do
    patch :update, id: @metier, metier: { name: @metier.name }
    assert_redirected_to metier_path(assigns(:metier))
  end

  test "should destroy metier" do
    assert_difference('Metier.count', -1) do
      delete :destroy, id: @metier
    end

    assert_redirected_to metiers_path
  end
end
