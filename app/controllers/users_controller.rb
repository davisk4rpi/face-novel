class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
