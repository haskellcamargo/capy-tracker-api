module ContactsHelper
  def humanize millis
    [[1000, :milliseconds], [60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if millis > 0
        millis, n = millis.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.join(' ')
  end
end
