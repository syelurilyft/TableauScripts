job_name='Tableau_Report_Export'
job_start_time=$(date +%s)

help_function() {
  printf "Usage: bash tableau_report_export.sh arguments

Pass the report_name and list of emails that the report need to published to
Example1: bash tableau_refresh_extract.sh arguments env=prod report_name='MarketHealth/Welcome'


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
            report_name)    report_name=${VALUE} ;;
            export_type)    export_type=${VALUE} ;;
            extra_properties) extra_properties=${VALUE} ;;
            email_subject) email_subject=${VALUE} ;;
            recipients) recipients=${VALUE} ;;
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
Report_Folder='/tmp'
echo "******** Printing Variables ********"
echo "Enviornment     :     "$env
echo "Tableau Server  :     "$server_url
echo "Report Name     :     "$report_name
echo "Report_Folder   :     "$Report_Folder

Processing_Step="Exporting Report"
if [ -n "$report_name" ]; then
  PDF_Name_First="$(cut -d'/' -f1 <<<"$report_name")"
  PDF_Name_Second="$(cut -d'/' -f2 <<<"$report_name")"
  if [ "$export_type" == "view" ]; then
    File_Name=${PDF_Name_First}_${PDF_Name_Second}.png
    bash /opt/tableau/tabcmd/bin/tabcmd export -s ${server_url} -u $tableau_username -p $tableau_password --no-cookie "${report_name}?:refresh=yes" --png ${extra_properties} -f "${File_Name}"
  else
    File_Name=${PDF_Name_First}_Dashboard.pdf
    bash /opt/tableau/tabcmd/bin/tabcmd export -s ${server_url} -u $tableau_username -p $tableau_password --no-cookie "${report_name}?:refresh=yes" --fullpdf ${extra_properties} -f "${File_Name}"
  fi
else
  help_function
  exit 1
fi


pwd

ls

Processing_Step="Moving Report to tmp folder"
mv ${File_Name} ${Report_Folder}

chmod 777 ${Report_Folder}/${File_Name}

Processing_Step="Emailing the Report"

echo '+----------+----------+----------+----------+----------+----------+'
echo '+----------+------------Emailing the report------------+----------+'
echo '+----------+----------+----------+----------+----------+----------+'


service_venv python /srv/service/current/lib/lyftdata/util/email_report.py ${File_Name} ${recipients} ${email_subject} || echo 'Email Failed'

echo 'Deleting the report'

rm ${Report_Folder}/${File_Name}

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
