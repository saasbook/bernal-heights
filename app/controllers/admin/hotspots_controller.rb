class Admin::HotspotsController < ApplicationController
  before_filter :is_admin
end
