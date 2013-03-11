# OpenBadges-Rails

Ruby on Rails Open Badges Issuer


## Create db tables
    openbadges-rails> rake db:migrate


## Load seed data into db
    openbadges-rails> rake db:seed


## Add an administrator for Open Badges admin interface
    openbadges-rails> rake app:add_admin[<email>,<password>] // Without spaces


## Testings
    openbadges-rails> rake test              // Run all tests
    openbadges-rails> rake app:test:units    // Run unit tests only
