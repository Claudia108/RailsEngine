class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json, :xml
end
