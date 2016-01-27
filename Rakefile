task :play do
  sh "./bin/ctc"
end

task :lint do
  sh "rubocop -a ."
end

task :doc do
  puts `yardoc 'lib'`
end

task :server do
  puts `yard server --reload`
end

task :bundle do
  sh "bundle install"
end

task default: %w(lint doc play)
task install: %w(bundle default)
