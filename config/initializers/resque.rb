ENV["REDISTOGO_URL"] ||= "redis://redistogo:3b8dffacd298e9fe66fdf0fbf4b12bb4@scat.redistogo.com:9226/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)

Dir["/app/app/jobs/*.rb"].each { |file| require file }