class TenkensController < ApplicationController
  def index
    @tenkens = Tenken.includes(:user)
  end
end
