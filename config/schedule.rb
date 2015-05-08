set :environment, "production"

every 5.minutes do 
  rake "send_scheduled_text:texts"
end

set :output, '/var/www/apps/11222/current/log/custom_deploy_after_migrate.log'