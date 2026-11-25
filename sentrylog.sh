REPORT_DIR="/var/log/sentrylog"
DATE=$(date +%F)
REPORT="$REPORT_DIR/security_report_$DATE.txt"

mkdir -p "$REPORT_DIR"

LOGS=$(journalctl --since "24 hours ago" --no-pager -o short-iso)

FAILED_AUTH=$(echo "$LOGS"| grep -Ei 'authentication failure|failed password|failed publickey|invalid user|authentication failed'||true)

SERVICE_FAILURES=$(echo "$LOGS"| grep -Ei 'failed to start|failed with result|service.*failed'||true)

ERRORS=$(journalctl --since "24 hours ago" -p err..emerg --no-pager -o short-iso)
#Generate report
{
	echo "==========================================="
	echo " SENTRYLOG SECURITY DIGEST"
	echo "==========================================="
	echo "Date:$DATE"
	echo "Hostname:$(hostname)"
	echo "Report Period:Last 24 Hours"
	echo

	echo "-----FAILED AUTHENTICATION ATTEMPTS ----"
	echo "$FAILED_AUTH"
	echo
	echo "---SERVICE FAILURES----"
	echo "$SERVICE_FAILURES"
	echo

	echo "---ERROR AND CRITICAL EVENTS---"
	echo "$ERRORS"
	echo

	echo "----EVENT COUNTS----"
             
	AUTH_COUNT=$(echo "$FAILED_AUTH"| grep -c .||true)
	SERVICE_COUNT=$(echo "$SERVICE_FAILURES"|grep -c .||true)
	ERROR_COUNT=$(echo "$ERRORS"| grep -c .||true)
	echo "Failed Authentication:$AUTH_COUNT"
	echo "Service Failures:$SERVICE_COUNT"
	echo "Error Events:$ERROR_COUNT"
	echo

	echo "----SOURCE IP ANALYSIS----"

	IPS=$(echo "$FAILED_AUTH"| grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}'|sort -u || true)
	for IP in $IPS
	do
		COUNT=$(echo "$FAILED_AUTH"| grep -F -c "$IP"||true)
		if ["$COUNT" -gt 5 ]; then
			echo "$IP:$COUNT failures - SUSPECT"
		else
			echo "$IP:$COUNT failures"
		fi
	done
	echo
	echo "----END OF REPORT----"
}>"$REPORT"



echo "Security report generated:$REPORT"
