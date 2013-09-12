module CreditCardFormatting
  # https://github.com/Shopify/active_merchant/blob/master/lib/active_merchant/billing/credit_card_methods.rb#L5
  CARD_PATTERNS = {
    'visa'       => /\A4\d{12}(\d{3})?\z/,
    'mastercard' => /\A(5[1-5]\d{4}|677189)\d{10}\z/,
    'discover'   => /\A(6011|65\d{2}|64[4-9]\d)\d{12}|(62\d{14})\z/,
    'amex'       => /\A3[47]\d{13}\z/,
  }
end