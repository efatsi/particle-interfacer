class ControlController < ApplicationController
  def index
  end

  def function
    value = core.function(name, argument)
    render json: {response: "value"}
  rescue => e
    render json: {response: e.to_s}
  end

  def variable
    value = core.variable(name)
    render json: {response: value}
  rescue => e
    render json: {response: e.to_s}
  end

  private

  %w(access_token core_id name argument).each do |field|
    define_method field do
      params[:api_call][field]
    end
  end

  def core
    RubySpark::Core.new(core_id, access_token)
  end
end
