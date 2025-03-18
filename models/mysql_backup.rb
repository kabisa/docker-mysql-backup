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

  encrypt_with GPG do |encryption|
    encryption.keys = {}
    encryption.keys['support@kabisa.nl'] = <<-KEY
      -----BEGIN PGP PUBLIC KEY BLOCK-----
      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
      YyBXueklxLT4uaUF2ekUYp/aTW9X2Tk=
      =s1R3
      -----END PGP PUBLIC KEY BLOCK-----
   KEY
    encryption.recipients = 'support@kabisa.nl'
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  store_with S3 do |s3|
    s3.path = ENV['AWS_S3_PATH']
  end

end


