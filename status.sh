#!
echo 'running status.sh'

sites=(
    'https://www.turkosaur.us'
    'https://nailivic.herokuapp.com/login'
    'https://fake.zzzz'
)
for site in ${sites[*]}
do
  response=$(curl -LIs $site -o /dev/null -w '%{http_code}')
  echo $(date +"%Y-%m-%dT%H:%M:%S%:z")',' $response',' $site >> status.csv
  if [ "$response" != 200 ]; then
    echo ERROR:$site #TODO have this trigger an alert
  fi
done
cat status.csv
