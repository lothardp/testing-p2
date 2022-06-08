class Admin::AdminController < ApplicationController
  before_action :set_admin, :set_selected

  private

  def set_admin
    @admin = true
  end

  def set_selected
    @selected = "flights"
  end
end
