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
  return array
end

def check_pass(trand, max, *status)
  array = status.clone
  array[trand] += 1
  if trand==0
    return true
  end
  flag = true
  while array.length != 1 do
    tmp = array.shift
    if tmp < array[0]
      flag =  false
      break
    end
  end
  return flag
end

p ge(30, 500)