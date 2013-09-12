require 'validable_credit_card'
require 'credit_card_resolver'

class CreditCard
  include ValidableCreditCard
  attr_reader :number

  def initialize number
    @number = number
  end

  def card_type
    @card_type ||= CreditCardResolver.new(self).resolve_company
  end
end