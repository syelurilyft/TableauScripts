job_name='Tableau_Extract_Refresh'
job_start_time=$(date +%s)

help_function() {
  printf "Usage: bash tableau_refresh_extract.sh arguments

If you want to run using project and Datasource. This is preferred when report and datasource are published seperately
Example1: bash tableau_refresh_extract.sh arguments env=prod project='Data Sources - Business Health' datasource='Business Health - RMHM'

If you want to run using report url. This is preferred when report and datasource are published together
Example2:bash tableau_refresh_extract.sh arguments env=prod url='PMMDashboard2018Q4/WeeklyPMMDetail'

If env is not provided, it routes to dev tableau server.

Options:

--help     Print this page
"
}
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  help_function
  exit 0
fi

trap : 0
echo >&2 '
********************************
*** '$job_name' LOAD STARTED ***
********************************
'
abort()
{
    echo >&2 '
**************************************
*** ERROR CODE '$job_name' ABORTED ***
**************************************
'
    echo "An error occurred. Exiting while *****************"$Processing_Step >&2
    exit 1
}
trap 'abort' 0
set -e
echo '+----------+----------+----------+----------+----------+----------+'
echo '+----------+---- Starting to Refresh Tableau Extract---+----------+'
echo '+----------+----------+----------+----------+----------+----------+'

Processing_Step="Assigning Arguments"
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)
    case "$KEY" in
            env)              env=${VALUE} ;;
            datasource)    datasource=${VALUE} ;;
            project)       project=${VALUE} ;;
            url)            url=${VALUE} ;;
            *)
    esac
done

if [ "$env" == "prod" ]; then
  server_url=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_PROD_SERVER_IP')"`
  tableau_username=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_PROD_USERNAME')"`
  tableau_password=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_PROD_PASSWORD')"`
else
  env='dev'
  server_url=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_DEV_SERVER_IP')"`
  tableau_username=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_DEV_USERNAME')"`
  tableau_password=`python -c "from lyft.settings import str_env; print str_env('CREDENTIALS_TABLEAU_DEV_PASSWORD')"`
fi

echo "******** Printing Variables ********"
echo "Enviornment     :     "$env
echo "Tableau Server  :     "$server_url
echo "Project         :     "$project
echo "Datasource      :     "$datasource
echo "url             :     "$url

Processing_Step="Refreshing Extract"
if [ -n "$url" ]; then
  extract_name="$(cut -d'/' -f1 <<<"$url")"
  report_name="$(cut -d'/' -f2 <<<"$url")"
  bash /opt/tableau/tabcmd/bin/tabcmd refreshextracts -s ${server_url} -u $tableau_username -p $tableau_password --no-cookie --synchronous ${extract_name}
elif [ -n "$project" ] && [ -n "$datasource" ]; then
  bash /opt/tableau/tabcmd/bin/tabcmd refreshextracts -s ${server_url} -u $tableau_username -p $tableau_password --no-cookie --synchronous --project "${project}" --datasource "${datasource}"
else
  help_function
  exit 1
fi

echo '+----------+----------+----------+----------+----------+----------+'
echo '+----------+----Completed to Refresh Tableau Extract---+----------+'
echo '+----------+----------+----------+----------+----------+----------+'
job_end_time=$(date +%s)

echo "Refresh Completed in : "$(( ($job_end_time-$job_start_time) / ( 60) )) minutes, $(( ($job_end_time-$job_start_time) % 60 )) seconds
trap : 0
echo >&2 '
************************************
***    '$job_name'  COMPLETED    ***
************************************
'
