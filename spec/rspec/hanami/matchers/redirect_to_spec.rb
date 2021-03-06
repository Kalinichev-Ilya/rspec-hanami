require 'spec_helper'
require 'rspec/hanami/matchers'

RSpec.describe "be matchers" do
  include RSpec::Hanami::Matchers

  let(:params) { {} }
  let(:site)   { 'http://example.com/' }

  describe '#be_success' do
    context 'for SuccessfulAction' do
      let(:action) { SuccessfulAction.new }

      it "return true" do
        response = action.call(params)
        expect(response).to_not redirect_to(site)
      end
    end

    context 'for FailedAction' do
      let(:action) { FailedAction.new }

      it "return false" do
        response = action.call(params)
        expect(response).to_not redirect_to(site)
      end
    end

    context 'for RedirectedAction' do
      let(:action) { RedirectedAction.new }

      it "return false" do
        response = action.call(params)
        expect(response).to redirect_to(site)
      end
    end
  end
end
