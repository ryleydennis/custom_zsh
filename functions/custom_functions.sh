function scrub() {
  # Clears terminal screen
  # https://askubuntu.com/a/473770
  clear && printf '\e[3J'
}

function listLinks() {
  ( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l
}

function go {
if [[ $1 =~ ^(--help|-h) ]]
then
    cat << EndOfMessage
Karius                       k | karius
Karius/kol                   kol
Karius/kom                   kom
Karius/karius-frontend       karius-frontend | kfe | front | frontend
Karius/braavos               b | braavos
Karius/MobileApp             mobile | mobile | mobileapp
Karius/order-management-web  o | order | order-managmeent | order-management-web
Karius/karius-cx-packages    p | package | packages | karius-cx-packages
Karius/accession-web         aw | accession | accession-web
EndOfMessage
    return
  fi

  case ${1:l} in 
  pp)
    cd "/Users/ryleydennis/PersonalProjects"
    ;;

  k | karius)
    cd /Users/ryleydennis/Karius
    ;;

  kol)
    cd /Users/ryleydennis/Karius/kol
    ;;
  
  kom)
    cd /Users/ryleydennis/Karius/kom
    ;;

  karius-frontend | kfe | front | frontend)
    cd /Users/ryleydennis/Karius/karius-frontend
    ;;

  b | braavos)
    cd /Users/ryleydennis/Karius/braavos
    ;;

  mobile | mobile | mobileapp)
    cd /Users/ryleydennis/Karius/MobileApp
    ;;
  
  o | order | order-managmeent | order-management-web | omw)
    cd /Users/ryleydennis/Karius/order-management-web
    ;;
  
  p | package | packages | karius-cx-packages | pac)
    cd /Users/ryleydennis/Karius/karius-cx-packages
    ;;
  
  aw | accession | accession-web)
    cd /Users/ryleydennis/Karius/accession-web
    ;;

  *)
    echo "\"${1}\" has not been defined"
    ;;

  esac
  
  if [[ "$2" = "-l" ||  "$2" = "l" ]]; then
    label ${1}
  fi
}

function label() {
  color=""
  label=""

echo $1
  case ${1:l} in
  pp)
    label="Personal Projects"
    color="--color \"#F78F79\""
    ;;

  kol)
    label="KOL"
    color="--color \"#464657\""
    ;;

  kom)
    label="KOM"
    color="--color \"#574653\""
    ;;
    
  karius-frontend | kfe | front | frontend)
    label="Karius Frontend"
    color="--color \"#f15c22\""
    ;;

  b | braavos)
    label="Braavos"
    color="--color \"#7F645E\""
    ;;

  *)
    label="$1"
    color="--color \"#313b47\""
    ;;
  esac

  eval "tabset '${label}' --badge '${label}' ${color}"
}
