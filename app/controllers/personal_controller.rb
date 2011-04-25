class PersonalController < ApplicationController
  before_filter :authenticate
end
