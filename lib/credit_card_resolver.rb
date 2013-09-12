require 'credit_card_formatting'

class CreditCardResolver
  CARD_FLAGS_RGX = Regexp.union [
                                  /(?<visa>#{CreditCardFormatting::CARD_PATTERNS['visa']})/,
                                  /(?<mastercard>#{CreditCardFormatting::CARD_PATTERNS['mastercard']})/,
                                  /(?<discover>#{CreditCardFormatting::CARD_PATTERNS['discover']})/,
                                  /(?<amex>#{CreditCardFormatting::CARD_PATTERNS['amex']})/
                                ]

  attr_reader :credit_card

  def initialize credit_card
    @credit_card = credit_card
  end

  def resolve_company
    mtch = credit_card.number.match CARD_FLAGS_RGX
    return 'VISA'       if mtch && mtch[:visa]
    return 'MasterCard' if mtch && mtch[:mastercard]
    return 'Discover'   if mtch && mtch[:discover]
    return 'AMEX'       if mtch && mtch[:amex]
    'Unknown'
  end
end