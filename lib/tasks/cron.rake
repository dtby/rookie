task :daily_cron_job => :environment do
  Merit::RankRules.new.check_rank_rules
end