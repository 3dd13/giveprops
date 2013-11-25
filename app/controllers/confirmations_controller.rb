class ConfirmationsController < Devise::ConfirmationsController

	def create
    # self.resource = resource_class.send_confirmation_instructions(resource_params)
    # yield resource if block_given?

    redirect_to root_path
  end

 protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    root_path
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    root_path
  end
end