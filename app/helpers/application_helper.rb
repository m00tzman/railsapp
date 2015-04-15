module ApplicationHelper

	def formatted_phone_number(phone)
		return unless phone.present?
		number_to_phone(phone) #could have put this directly in view
	end
end
