alias  b="bundle"
alias bi="b install --path .vendor"
alias bii="b install --path vendor"

alias bu="b update"
alias be="b exec"

alias br="be rackup"
alias sin="sudo bundle exec rackup -o sinatra -p 80 -E development"

alias bu="be unicorn"

alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
