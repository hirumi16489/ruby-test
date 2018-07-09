require 'ruby-enum'

class TransactionType
  include Ruby::Enum

  define :CREDIT, "credit"
  define :DEBIT, "debit"
end