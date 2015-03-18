# 最快质数生成算法
prime_table = [2,3,5,7,11,13,17,19,23,29,31,37]
max = Math.sqrt(50000).to_i
39.step(50000,2) do |i|
  flag = true
  prime_table.each do |p|
    break if p> max
    if i%p == 0
      flag = false
      break
    end
  end
  prime_table << i if flag
end

p prime_table.length