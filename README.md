# Ceppu
A minimal implementation of error reporting tool.
### install gem
```gem 'ceppu', git: 'https://github.com/kanaydo/ceppu.git'```
### generate model
```rails generate ceppu:model```
### track error on base controller
```rescue_from StandardError, with: :ceppu_in```

### optinal, if using sync to api service
- set env variable ```CEPPU_API_PATH```, ```CEPPU_API_KEY```
- adding callback to ```CeppuLog```
```
  after_create :sync_service

  def sync_service
    Ceppu::Event.sync_event(self)
  end

```
