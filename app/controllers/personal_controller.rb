class PersonalController < BaseController
  before_action :authenticate_user!
end
