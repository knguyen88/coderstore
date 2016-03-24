class Product < ActiveRecord::Base

  def self.alphabetical
    Product.order(name: :asc)
  end

  def self.totaldiscount
    Product.all
        .sort_by { |k| k.disccount_saleoff }
        .reverse
  end

  def disccount_saleoff
    get_saleoff_percentage * price_vnd
  end

  def price_after_saleoff
    price_vnd - disccount_saleoff
  end

  def get_saleoff_percentage
    percentage_sale = 0

    if price_vnd >= 100000
      percentage_sale = 0.21
    elsif price_vnd > 200000
      percentage_sale = 0.31
    elsif price_vnd > 800000
      percentage_sale = 0.41
    end

    percentage_sale
  end

  def get_saleoff_text
    if disccount_saleoff > 100000
      "Save over #{disccount_saleoff} VND"
    else
    "More than #{get_saleoff_percentage * 100}% off!"
    end
  end
end
