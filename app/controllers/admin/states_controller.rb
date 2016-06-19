class Admin::StatesController < Admin::BaseController
  def index
    @states = State.order(name: :asc)
  end
end
