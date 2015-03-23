require 'pry'
class Number
  def self.bin2dec(binary)
    decimal = 0
    a = binary.chars.reverse
    a.each_with_index {|n, i| decimal = decimal + n.to_i * (2 ** i)}
    decimal
  end

  def self.dec2bin(decimal)
    binary = ""
    until decimal == 0
      binary = (decimal % 2).to_s + binary
      decimal = decimal / 2  
    end
    binary
  end

  def self.bin2hex(binary)
    helper = {0 => "0", 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9", 10=>"a", 11=>"b", 12=>"c", 13=>"d", 14=>"e", 15=>"f"}
    hexadecimal = ""
    array = binary.chars.reverse
    array.each_slice(4) do |a|
      num = self.bin2dec(a.reverse.join)
      hexadecimal = helper[num] + hexadecimal
    end
    hexadecimal
  end

  def self.hex2bin(hexadecimal)
    helper = {'0' => 0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, "a"=>10, "b"=>11, "c"=>12, "d"=>13, "e"=>14, "f"=>15}
    binary = ""
    array = hexadecimal.chars
    array.each do |a|
      num = self.dec2bin(helper[a])
      while num.length < 4
        num = "0" + num
      end
      binary = binary + num
    end
    binary.to_i.to_s
  end
end


# hex = Hash.new do |hash, key|
#       key.to_i if key.to_i <= 9
#     end
