class ParanoidFormatter
  RSpec::Core::Formatters.register self, :start, :example_passed, :close

  def initialize(output)
    @output = output
  end

  def start(notification)
    @output << "These specs will still pass with inverted expectations:\n\n"
  end

  def close(notification)
    @output << "\n\nYou should review these tests and ensure they actually include `expect` statements!\n"
  end

  def example_passed(notification)
    @output << "#{notification.example.full_description} - #{notification.example.location}\n"
  end
end

# Monkey patch RSpec to switch expectations
module RSpec
  module Expectations
	class ExpectationTarget
	  def not_to(matcher=nil, message=nil, &block)
		prevent_operator_matchers(:to) unless matcher
		RSpec::Expectations::PositiveExpectationHandler.handle_matcher(target, matcher, message, &block)
	  end
	  def to(matcher=nil, message=nil, &block)
		prevent_operator_matchers(:not_to) unless matcher
		RSpec::Expectations::NegativeExpectationHandler.handle_matcher(target, matcher, message, &block)
	  end
	end
  end
end
