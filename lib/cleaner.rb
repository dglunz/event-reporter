class Cleaner
  def clean(data)
    data.nil? ? return : data.downcase.strip
  end
  def phone(data)
    data.gsub(/[\D]/, '')
  end
end
