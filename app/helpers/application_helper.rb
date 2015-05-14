module ApplicationHelper
  def core_options
    current_user.cores.map do |core|
      [core.name, core.core_id]
    end
  end
end
