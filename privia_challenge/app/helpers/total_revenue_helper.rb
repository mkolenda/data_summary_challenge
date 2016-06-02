module TotalRevenueHelper
  def each_total
    @total_price = []
    @purchases.each do |p|
      @total_price << ((p.item_price * p.purchase_count).to_f)
    end
    @total_price
  end

  def total_revenue
    each_total.inject(:+)
  end
end
