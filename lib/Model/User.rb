require 'ruby-enum'

class User
  include Ruby::Enum

  define :DRIVER, "driver"
  define :CAR_OWNER, "owner"
  define :INSURANCE, "insurance"
  define :ASSISTANCE, "assistance"
  define :DRIVY, "drivy"
end