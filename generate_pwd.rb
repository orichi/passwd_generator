small_latin	= ('a'..'z').to_a
large_latin	= ('A'..'Z').to_a
number 		= (0..9).to_a
else_char	= ['!','@','#','$','%','^','&']
if File.exist?("key_list")
	file = File.open('key_list' ,'a')

else
	file = File.new('key_list', 'w')	
end
file.puts (Time.now).strftime("%Y-%m-%d")+"\r\n"
	char_array = small_latin.shuffle[0,3] + large_latin.shuffle[0,3] + number.shuffle[0,1] + else_char.shuffle[0,1]
	string = char_array.shuffle!.join() + "\r\n"
	file.puts "\t\t"+string
file.close