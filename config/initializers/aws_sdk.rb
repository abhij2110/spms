require 'aws-sdk-core'

Aws.config.update({
  region: 'eu-north-1',
  credentials: Aws::Credentials.new('AKIAYS2NVR6C6CHARLU7', 'cwbebcRA3fnV1aHnjQCVbWewwz+IGrAQS7XK5jz2')
})

logger = Logger.new($stdout)
logger.level = Logger::DEBUG

Aws.config[:logger] = logger

