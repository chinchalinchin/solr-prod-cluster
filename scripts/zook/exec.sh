SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT_NAME='exec'
nl=$'\n'
SCRIPT_DES="Execute a string of commands inside of the \e[3mtitanic-zook\e[0m container. The command ${nl}\
    must be provided as a string enclosed in quotation marks and you must specify which one of the ${nl}
    running containers you want to execute in with an integer, i.e., ${nl}${nl}\
        bash ./exec.sh 1 \"do something in zook container\"${nl}${nl}
    As such, make sure to start the \e[3mtitanic\e[0m cluster before executing this script."
source "$SCRIPT_DIR/../util/logging.sh"

if [ "$1" == "--help" ] || [ "$1" == "--h" ] || [ "$1" == "-help" ] || [ "$1" == "-h" ]
then
    help "$SCRIPT_DES" $SCRIPT_NAME
else
    CONTAINER_ID="$(docker container ps --filter name=zook --quiet)"

    log "Executing \"$2\" Inside of Container ID #$CONTAINER_ID" $SCRIPT_NAME
    docker exec $CONTAINER_ID bash -c "$1"
fi