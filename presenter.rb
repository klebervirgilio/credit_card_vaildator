require 'credit_card'

class Presenter
  attr_reader :cc
  def initialize number
    @cc = CreditCard.new number
  end

  def present
    "#{cc.card_type}: #{cc.number} (#{valid_str})"
  end

  def valid_str
    cc.valid? ? 'valid' : 'invalid'
  end
end