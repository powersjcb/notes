namespace :db do
  namespace :test do
    task :prepare => :environment do
      Rake::Task["db:migrate"].invoke
      Rake::Task["db:seed"].invoke
    end
  end
end

task :aa => :environment do
  Rake::Task["db:migrate:reset"].invoke
  Rake::Task["db:test:prepare"].invoke
end
