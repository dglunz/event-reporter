class Cleaner
  def clean(data)
    data.downcase.strip
  end
  def phone(data)
    data.gsub(/[\D]/, '')
  end
end
