module MethodFinancial
  class Errors < StandardError
    def initialize(message)
      super(message)
    end
  end
end