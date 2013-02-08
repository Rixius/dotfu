alias  b="bundle"
alias bi="b install --path vendor"
alias bp="b package"

alias be="b exec"

alias br="be rackup"

alias bu="be unicorn"

alias binit="bi && bp && echo 'vendor/ruby' >> .gitignore"

alias sin="br -o sinatra -p 4567"
export RACK_ENV='development'
