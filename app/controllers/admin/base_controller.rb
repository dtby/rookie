class Admin::BaseController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "123456"
  layout 'admin'
end

