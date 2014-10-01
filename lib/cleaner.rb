class Cleaner
  def clean(data)
    data.nil? ? '' : data.downcase.strip
  end
  def phone(data)
    data.nil? ? '' : data.gsub(/[\D]/, '')
  end
end
