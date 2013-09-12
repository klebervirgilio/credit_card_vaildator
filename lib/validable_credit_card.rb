require 'delegate'

module ValidableCreditCard
  class LengthError < StandardError; end
  class LuhnError   < StandardError; end

  class LengthValidator < SimpleDelegator
    VISA_LENGTH       = (13..16)
    DISCOVER_LENGTH   = 16
    MASTERCARD_LENGTH = 16
    AMEX_LENGTH       = 15

    def validate!
      valid? or raise LengthError
    end

    def valid?
      length_for(card_type) === number.to_s.length
    end

    private
    def length_for card_type
      LengthValidator.const_get("#{card_type.upcase}_LENGTH")
    end
  end

  class LuhnValidator < SimpleDelegator
    def validate!
      valid? or raise LuhnError
    end

    def valid?
      # https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/credit_card_methods.rb#L131
      sum = 0

      for i in 0..number.length
        weight = number[-1 * (i + 2), 1].to_i * (2 - (i % 2))
        sum += (weight < 10) ? weight : weight - 9
      end

      (number[-1,1].to_i == (10 - sum % 10) % 10)
    end
  end

  def valid_flag?
    card_type and card_type != 'Unknown'
  end

  def valid?
    valid_flag? &&
    LengthValidator.new(self).valid? &&
    LuhnValidator.new(self).valid?
  end

  def invalid?
    valid? == false
  end
end