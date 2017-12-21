class ManaCost

  def self.convert(text)
    if text.empty?
      return 0
    end

    total = 0
    text.tr!('Ａ-Ｚ', 'A-Z')
    text.tr!('０-９', '0-9')
    costs = text.scan(/\([^\(\)]+\)/)

    costs.each do |cost|
      if cost.match(/\d+/)
        total += Regexp.last_match(0).to_i
      elsif cost.match('(X)')
        total += 0
      else
        total += 1
      end
    end

    return total
  end

end
