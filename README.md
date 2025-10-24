# Ceppu
A minimal implementation of error reporting tool.
### install gem
```gem 'ceppu', git: 'https://github.com/kanaydo/ceppu.git'```
### generate model
```rails generate ceppu:model```
### track error on base controller
```rescue_from StandardError, with: :ceppu_in```
