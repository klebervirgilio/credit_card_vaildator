require 'spec_helper'
require 'credit_card'
require 'credit_card_resolver'
require 'validable_credit_card'

describe CreditCard do
  context 'VISA' do
    subject { CreditCard.new '4111111111111111'}
    its(:card_type) { should match /VISA/ }

    describe "Validation" do
      context 'when valid' do
        its(:valid?) { should be_true }
      end
      context 'when invalid' do
        subject { CreditCard.new '4111111111111'}
        its(:invalid?) { should be_true }
      end
    end
  end

  context 'AMEX' do
    subject { CreditCard.new '378282246310005'}
    its(:card_type) { should match /AMEX/ }

    describe "Validation" do
      context 'when valid' do
        its(:valid?) { should be_true }
      end
      context 'when invalid' do
        subject { CreditCard.new '4111111111111'}
        its(:invalid?) { should be_true }
      end
    end
  end

  context 'MasterCard' do
    subject { CreditCard.new '5105105105105100'}
    its(:card_type) { should match /MasterCard/ }

    describe "Validation" do
      context 'when valid' do
        its(:valid?) { should be_true }
      end
      context 'when invalid' do
        subject { CreditCard.new '5175705705707100' }
        its(:invalid?) { should be_true }
      end
    end
  end

  context 'Discover' do
    subject { CreditCard.new '6011111111111117'}
    its(:card_type) { should match /Discover/ }

    describe "Validation" do
      context 'when valid' do
        its(:valid?) { should be_true }
      end
      context 'when invalid' do
        subject { CreditCard.new '6011111113331117'}
        its(:invalid?) { should be_true }
      end
    end
  end

  context 'Unknown' do
    subject { CreditCard.new '010101010101'}
    its(:card_type) { should match /Unknown/ }
    its(:valid?) { should be_false }
  end
end