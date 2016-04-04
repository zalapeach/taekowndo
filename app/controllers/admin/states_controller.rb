class Admin::StatesController < Admin::BaseController
  def index
    @states = State.all
  end
end
