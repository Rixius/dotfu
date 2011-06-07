alias bemail="b exec mail_worker -l debug -n http://localhost:8080/"
alias betran="b exec transcoder -l debug -n http://localhost:8080/"

function rvmdef {
  rvm use 1.9.2@default
}
