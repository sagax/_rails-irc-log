# encoding: utf-8
module ApplicationHelper

  def is_true? val
    ['1', 'true', 'yes', 'on'].include? val.to_s
  end

end
