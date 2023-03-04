# Price List
price_list = {'milk' => 3.97, 'bread' => 2.17, 'banana' => 0.99, 'apple' => 0.89}

# Hash of items and number of items on which discount is available
discounted_item_list = {'milk' => 2, 'bread' => 3}

# Hash of item and discounted price
discounted_price_list = {'milk' => 5, 'bread' => 6}


# Enter purchased items
p 'Please Enter All item purchased seperated by comma'
item_list = gets.chomp.split(',');
item_count = {}

if item_list - price_list.keys == []
    # create hash of purchased item and number of items
    item_list.each do |item|
        count = 1;
        if item_count.key?(item)
            count = item_count[item] + 1;
        end
        item_count[item] = count
    end

    p "Item     Quantity     Price"
    p "----------------------------"

    # Calculation
    original_price = 0;
    discounted_price = 0
    item_count.each do |item,price|
        original_price = original_price + (item_count[item] * price_list[item])
        if discounted_item_list.key?(item)
            price = ((item_count[item] / discounted_item_list[item]).to_i * discounted_price_list[item]) + ((item_count[item] % discounted_item_list[item]) * price_list[item])
        else
            price = item_count[item] * price_list[item];
        end
        discounted_price = discounted_price + price;
        p "#{item.upcase}     #{item_count[item]}          $#{price}"
    end
    p "Total Price : $#{discounted_price.round(2)}"
    p "You saved $#{(original_price - discounted_price).round(2)} today"
else
    p "Please Enter valid item"
end
