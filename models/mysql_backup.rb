# encoding: utf-8

Model.new(:mysql_backup, 'MySQL Backup') do

  database MySQL do |db|
    db.username           = ENV["DB_USERNAME"]
    db.password           = ENV["DB_PASSWORD"]
    db.host               = ENV["DB_HOST"]
    db.port               = ENV["DB_PORT"].to_i
    db.name               = ENV["DB_NAME"]
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these" "tables"]
    db.additional_options = ["--quick", "--single-transaction"]
    db.prepare_backup = true # see https://github.com/meskyanichi/backup/pull/606 for more information
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  store_with S3 do |s3|
    s3.path = ENV['AWS_S3_PATH']
  end

end


