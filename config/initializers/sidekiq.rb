# schedule_file = "config/sidekiq-cron.yml"

# if File.exist?(schedule_file) && Sidekiq.server?
#    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end

Sidekiq::Cron::Job.create(name: 'Cron job', cron: '13 10 * * *', class: 'UserActivityJob') if Sidekiq.server?