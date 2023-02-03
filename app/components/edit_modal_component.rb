# frozen_string_literal: true

class EditModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:)
    @title = title
  end
end
