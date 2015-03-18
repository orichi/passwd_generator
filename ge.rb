require 'benchmark'
def ge(max, count)
  status = Array.new(max,0)
  array = []
  while array.length < count do 
    trand = rand(max)
    if check_pass(trand, max, *status)
      array << (trand + 1) 
      status[trand] += 1
    else
      next
    end
  end
  p status
  return array
end

def check_pass(trand, max, *status)
  array = status.clone
  array[trand] += 1
  flag = true
  half1 = array[0...trand]
  half2 = array - half1
  if half1.uniq.length != trand
    return false
  end
  min = half2.min || 0
  if min > 0 && half2.uniq.length != half2.length
    return false
  end
  while array.length != 1 do
    tmp = array.shift
    if tmp < array[0]
      flag =  false
      break
    end
  end
  array = nil
  return flag
end

# Benchmark.bm{|bm| bm.report{ge(10,100000)}}
ge(10,1000)
