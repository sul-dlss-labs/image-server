# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task test: [:fetch_remote_file]

task :fetch_remote_file do
  dir = 'test/fixtures/files/dz302gz2129'
  Dir.mkdir(dir) unless File.exist?(dir)
  filename = 'PC0082_b06_f01_Baseball_1986_0012.jp2'
  file = File.join(dir, filename)
  unless File.exist?(file)
    `curl https://stacks.stanford.edu/file/dz302gz2129/#{filename} -o #{file}`
  end
end
