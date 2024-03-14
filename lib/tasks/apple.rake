desc "Print reminder about eating more fruit."
task :apple do
  name = gets.chomp
  puts "Eat more apples!#{name}"
  # puts "Eat more apples!"
end

task :action do
  STDOUT.puts "I'm acting!"
end

task :check do
  STDOUT.puts "Are you sure? (y/n)"
  input = STDIN.gets.strip
  if input == 'y'
    # Rake::Task["action"].reenable
    # Rake::Task["action"].invoke
    STDOUT.puts "I'm acting!"
  else
    STDOUT.puts "So sorry for the confusion"
  end
end