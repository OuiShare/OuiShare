require 'spec_helper'

describe Authorization do
  subject { Authorization.make! }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
end
