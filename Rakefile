# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task test: [:fetch_remote_file]

task :fetch_remote_file do
  dir = 'test/fixtures/files/dz302gz2129'
  filename = 'PC0082_b06_f01_Baseball_1986_0012.jp2'
  url = "https://stacks.stanford.edu/file/dz302gz2129/#{filename}"
  fetch(dir, filename, url)

  dir = 'test/fixtures/files/validator'
  filename = '67352ccc-d1b0-11e1-89ae-279075081939.jp2'
  url = "http://iiif.io/api/image/validator/#{filename}"
  fetch(dir, filename, url)
end

def fetch(dir, filename, url)
  Dir.mkdir(dir) unless File.exist?(dir)
  file = File.join(dir, filename)
  unless File.exist?(file)
    `curl #{url} -o #{file}`
  end
end
