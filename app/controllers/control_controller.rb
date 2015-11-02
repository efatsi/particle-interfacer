class ControlController < ApplicationController
  def index
  end

  def function
    value = core.function(name, argument)
    render json: {response: value}
  rescue => e
    render json: {response: e.to_s}
  end

  def variable
    binding.pry
    value = core.variable(name)
    render json: {response: value}
  rescue => e
    render json: {response: e.to_s}
  end

  private

  %w(core_id name argument).each do |field|
    define_method field do
      params[:api_call][field]
    end
  end

  def access_token
    if current_user
      current_user.try(:access_token)
    else
      params[:api_call][:access_token]
    end
  end

  def timeout
    if current_user
      current_user.try(:timeout)
    else
      10.seconds
    end
  end

  def core
    @core ||= begin
      RubySpark.configuration do |config|
        config.access_token = access_token
        config.timeout      = timeout
      end

      RubySpark::Core.new(core_id)
    end
  end
end
