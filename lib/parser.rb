class Parser
  def parse(commands)
    commands = input.strip.downcase.split(" ")
    if multiple_commands?
      argument = commands[1..-1]
      attribute = argument.first
      criteria = argument[1..-1].join(" ")
      commands, argument, attribute, criteria
    else
      commands
    end
  end

  def predicate_index
    argument.index("and")
  end

  def parse_attribute
    attribute_index = predicate_index + 1
    argument[attribute_index]
  end

  def parse_second_criteria
    argument[predicate_index + 2..-1].join(" ")
  end

  def parse_criteria
    criteria_end = predicate_index - 1
    argument[1..criteria_end].join(" ")
  end

  def single_find_criteria?
    argument.none? { |word| word == "and" }
  end

  def valid_attribute?(attribute)
    Entry.instance_methods.include?(attribute.to_sym)
  end

  end
end
