require 'spec_helper'
require 'presenter'

describe Presenter do
  context "valid visa" do
    subject { Presenter.new('4111111111111111') }
    its(:present) {should eq 'VISA: 4111111111111111 (valid)' }
  end
  context "invalid visa" do
    subject { Presenter.new('4111111111111') }
    its(:present) {should eq 'VISA: 4111111111111 (invalid)' }
  end
end