terraform state show | egrep -e 'public_ip(.*)= [^true]' | cut -f 2 -d '=' | xargs
