Time::DATE_FORMATS[:default] = "%m/%d/%Y %I:%M:%S %p"
#Time::DATE_FORMATS[:datepicker] = "%m/%d/%Y %H:%M:%S PP"
Time::DATE_FORMATS[:datepicker] = lambda { |time| time.strftime("%m/%d/%Y %I:%M:%S %p") }