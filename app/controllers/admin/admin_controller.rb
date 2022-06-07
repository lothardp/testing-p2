class Admin::AdminController < ApplicationController
  before_action :set_admin

  private

  def set_admin
    @admin = true
  end
end
