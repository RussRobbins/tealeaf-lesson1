# Safer picture downloading

# Target directory
target_dir = 'C:/Users/Russ/Pictures/Import'
Dir.chdir target_dir
# Scan target directory for pictures to move
pic_names = Dir['D:/Art/Camera/*.jpg']
puts "Found #{pic_names.length} pictures."
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files:  "
# Counter/progress
pic_number = 1
pic_names.each do |name|
  print '.'
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end
  #  This renames the picture, but since "name" has a big long path on it, and "new_name" doesn't, it also moves the file to the
  #  current working directory, which is now the target directory.
  if File.exist? new_name
    puts "Ooops! A file already exists called #{new_name}. Aborting now."
    exit
  else
    File.rename name, new_name
  end
  # Finally, we increment the counter.
  pic_number = pic_number + 1
end
puts "\nAll done!"
