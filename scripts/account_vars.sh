# Accounts and exec commands
#############################################################################################################################
# import dependencies
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/vars.sh
echo "Getting relevant addresses..."

# Stride
STRIDE_ADDRESS_1=$($BASE_RUN keys show val1 --home $STATE/stride1 --keyring-backend test -a)
STRIDE_ADDRESS_2=$($BASE_RUN keys show val2 --home $STATE/stride2 --keyring-backend test -a)
STRIDE_ADDRESS_3=$($BASE_RUN keys show val3 --home $STATE/stride3 --keyring-backend test -a)

# Gaia
GAIA1_EXEC="docker-compose --ansi never exec -T gaia1 gaiad --home /gaia/.gaiad"
GAIA2_EXEC="docker-compose --ansi never exec -T gaia2 gaiad --home /gaia/.gaiad"
GAIA3_EXEC="docker-compose --ansi never exec -T gaia3 gaiad --home /gaia/.gaiad"
GAIA_ADDRESS_1=$($GAIA1_EXEC keys show gval1 --keyring-backend test -a --home=/gaia/.gaiad)
GAIA_ADDRESS_2=$($GAIA2_EXEC keys show gval2 --keyring-backend test -a --home=/gaia/.gaiad)
GAIA_ADDRESS_3=$($GAIA3_EXEC keys show gval3 --keyring-backend test -a --home=/gaia/.gaiad)

# Relayers
# NOTE: using $STRIDE_MAIN_CMD and $GAIA_MAIN_CMD here ONLY works because they rly1 and rly2
# keys are on stride1 and gaia1, respectively
RLY_ADDRESS_1=$($STRIDE_MAIN_CMD keys show rly1 --keyring-backend test -a)
RLY_ADDRESS_2=$($GAIA_MAIN_CMD keys show rly2 --keyring-backend test -a)

STR1_EXEC="docker-compose --ansi never exec -T stride1 strided --home /stride/.strided --chain-id STRIDE"
STR2_EXEC="docker-compose --ansi never exec -T stride2 strided --home /stride/.strided --chain-id STRIDE"
STR3_EXEC="docker-compose --ansi never exec -T stride3 strided --home /stride/.strided --chain-id STRIDE"

echo "Grabbed all data, running tests..."