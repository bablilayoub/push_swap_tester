# Push swap tester BY: Ayoub Bablil
# If you have any questions or suggestions, feel free to contact me on discord: .thexd

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m'

YELLOW_BACKGROUND='\033[30m\033[103m'
RED_BACKGROUND='\033[30m\033[101m'
BLUE_BACKGROUND='\033[30m\033[104m'
GREEN_BACKGROUND='\033[30m\033[102m'

# Variables
PUSH_SWAP_PATH="../push_swap"
CHECKER_LINUX_PATH="./checker_linux"
CHECKER_MAC_PATH="./checker_Mac"
CHECKER_PATH=""
NUMBER_OF_ARGUMENTS=$1
NUMBER_OF_TESTS=$2
BEST_CASE=0
WORST_CASE=0
AVERAGE=0
SUCCESS=0
INDEX=0

# Functions
function device() {
	if [ "$(uname)" == "Darwin" ]; then
		CHECKER_PATH=$CHECKER_MAC_PATH
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		CHECKER_PATH=$CHECKER_LINUX_PATH
	fi
}

function print_message() {
	printf "\n${LIGHT_BLUE}██████╗ ██╗   ██╗███████╗██╗  ██╗    ███████╗██╗    ██╗ █████╗ ██████╗     ████████╗███████╗███████╗████████╗███████╗██████╗\n"
	printf "██╔══██╗██║   ██║██╔════╝██║  ██║    ██╔════╝██║    ██║██╔══██╗██╔══██╗    ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗\n"
	printf "██████╔╝██║   ██║███████╗███████║    ███████╗██║ █╗ ██║███████║██████╔╝       ██║   █████╗  ███████╗   ██║   █████╗  ██████╔╝\n"
	printf "██╔═══╝ ██║   ██║╚════██║██╔══██║    ╚════██║██║███╗██║██╔══██║██╔═══╝        ██║   ██╔══╝  ╚════██║   ██║   ██╔══╝  ██╔══██╗\n"
	printf "██║     ╚██████╔╝███████║██║  ██║    ███████║╚███╔███╔╝██║  ██║██║            ██║   ███████╗███████║   ██║   ███████╗██║  ██║\n"
	printf "╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝            ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝\n\n${NC}"
	printf "\t\t\t\t\t   By the one and only ${RED_BACKGROUND} Ayoub Bablil ${NC}\n\n"
}

function create_file() {
	# Create folder if not exist
	if [ ! -d "error_cases" ]; then
		mkdir error_cases
	fi
	FILE_NAME="./error_cases/error_case_$INDEX.txt"
	INSTRUCTIONS_FILE_NAME="./error_cases/error_case_instructions_$INDEX.txt"

	touch $FILE_NAME
	touch $INSTRUCTIONS_FILE_NAME

	# Write error case to file
	echo $ARG >$FILE_NAME
	# Write instructions to file
	./$PUSH_SWAP_PATH $ARG >$INSTRUCTIONS_FILE_NAME
}

function tester() {
	# Generate random arguments (from between -10000 and 10000)
	ARG=$(ruby -e "puts (-10000..10000).to_a.shuffle[0..$1].join(' ')")
	RESULT=$(./$PUSH_SWAP_PATH $ARG | ./$CHECKER_PATH $ARG)
	NUMBER_OF_INSTRUCTIONS=$(./$PUSH_SWAP_PATH $ARG | wc -l | tr -d ' ')
	INDEX=$((INDEX + 1))
	# Set number of instructions to 0 if it's not a number
	if ! [[ $NUMBER_OF_INSTRUCTIONS =~ ^[0-9]+$ ]]; then
		NUMBER_OF_INSTRUCTIONS=0
	fi
	# Check if it's the best case
	if [ $BEST_CASE -eq 0 ]; then
		BEST_CASE=$NUMBER_OF_INSTRUCTIONS
	elif [ $NUMBER_OF_INSTRUCTIONS -lt $BEST_CASE ]; then
		BEST_CASE=$NUMBER_OF_INSTRUCTIONS
	fi
	# Check if it's the worst case
	if [ $NUMBER_OF_INSTRUCTIONS -gt $WORST_CASE ]; then
		WORST_CASE=$NUMBER_OF_INSTRUCTIONS
	fi
	# Calculate average
	AVERAGE=$((AVERAGE + NUMBER_OF_INSTRUCTIONS))
	# Increment success
	SUCCESS=$((SUCCESS + 1))

	# Case of 100 arguments
	if [ $NUMBER_OF_ARGUMENTS -eq 100 ]; then
		# if number of instructions is less than 700
		if [ $NUMBER_OF_INSTRUCTIONS -lt 700 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${GREEN}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is less than 1500
		elif [ $NUMBER_OF_INSTRUCTIONS -lt 1500 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${YELLOW}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is more than 1500
		else
			NUMBER_OF_INSTRUCTIONS_COLOR=${RED}$NUMBER_OF_INSTRUCTIONS${NC}
		fi
	fi
	# Case of 500 arguments
	if [ $NUMBER_OF_ARGUMENTS -eq 500 ]; then
		# if number of instructions is less than 5500
		if [ $NUMBER_OF_INSTRUCTIONS -lt 5500 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${GREEN}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is less than 11500
		elif [ $NUMBER_OF_INSTRUCTIONS -lt 11500 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${YELLOW}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is more than 11500
		else
			NUMBER_OF_INSTRUCTIONS_COLOR=${RED}$NUMBER_OF_INSTRUCTIONS${NC}
		fi
	fi
	# Case of 3 arguments
	if [ $NUMBER_OF_ARGUMENTS -eq 3 ]; then
		# if number of instructions is less than 3
		if [ $NUMBER_OF_INSTRUCTIONS -lt 3 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${GREEN}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is more than 3
		else
			NUMBER_OF_INSTRUCTIONS_COLOR=${RED}$NUMBER_OF_INSTRUCTIONS${NC}
		fi
	fi
	# Case of 5 arguments
	if [ $NUMBER_OF_ARGUMENTS -eq 5 ]; then
		# if number of instructions is less than 12
		if [ $NUMBER_OF_INSTRUCTIONS -lt 12 ]; then
			NUMBER_OF_INSTRUCTIONS_COLOR=${GREEN}$NUMBER_OF_INSTRUCTIONS${NC}
		# if number of instructions is more than 12
		else
			NUMBER_OF_INSTRUCTIONS_COLOR=${RED}$NUMBER_OF_INSTRUCTIONS${NC}
		fi
	fi
	# set color to green for other cases
	if [ $NUMBER_OF_ARGUMENTS -ne 3 ] && [ $NUMBER_OF_ARGUMENTS -ne 5 ] && [ $NUMBER_OF_ARGUMENTS -ne 100 ] && [ $NUMBER_OF_ARGUMENTS -ne 500 ]; then
		NUMBER_OF_INSTRUCTIONS_COLOR=${GREEN}$NUMBER_OF_INSTRUCTIONS${NC}
	fi

	if [ "$RESULT" == "OK" ]; then
		printf "Test case : $INDEX | STATUS: ${GREEN} OK ${NC} | Number of instructions: $NUMBER_OF_INSTRUCTIONS_COLOR\n"
	else
		create_file $ARG
		NUMBER_OF_INSTRUCTIONS_COLOR=${RED}$NUMBER_OF_INSTRUCTIONS${NC}
		printf "Test case : $INDEX | STATUS: ${RED} KO ${NC} | Number of instructions: $NUMBER_OF_INSTRUCTIONS_COLOR\n"
	fi
}

function at_exit() {
	# Calculate average
	AVERAGE=$((AVERAGE / NUMBER_OF_TESTS))
	# Print results
	printf "\n"
	printf "${YELLOW_BACKGROUND} RESULTS ${NC}\n\n"
	printf "Success: ${GREEN}$SUCCESS / $NUMBER_OF_TESTS${NC}\n"
	printf "Failure: ${RED}$((NUMBER_OF_TESTS - SUCCESS)) / $NUMBER_OF_TESTS${NC}\n"
	printf "Best case: ${GREEN}$BEST_CASE${NC}\n"
	printf "Worst case: $WORST_CASE\n"
	printf "Average: $AVERAGE\n"

	# if error cases exist by checking failure
	if [ $((NUMBER_OF_TESTS - SUCCESS)) -ne 0 ]; then
		printf "\n${YELLOW_BACKGROUND} You can find error cases in error_cases folder ${NC}\n"
	fi

	printf "\n"
	printf "See you soon ${RED_BACKGROUND} Ayoub Bablil ${NC}\n"
}

function clean_error_cases() {
	# Remove error cases folder if exist
	if [ -d "error_cases" ]; then
		rm -rf error_cases
	fi
}

function parsing_tester() {
	# Test program with no arguments
	RESULT=$(./$PUSH_SWAP_PATH | wc -l | tr -d ' ')
	printf "\nTesting program with no arguments: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with sorted arguments
	RESULT=$(./$PUSH_SWAP_PATH 1 2 3 4 5 | wc -l | tr -d ' ')
	printf "Testing program with sorted arguments: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with duplicate arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 1 2 3 4 5 1 2 3 4 5 2>&1)
	printf "Testing program with duplicate arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with non numeric arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 1 2 3 4 5 a 2>&1)
	printf "Testing program with non numeric arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with non integer arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 1 2 3 4 5 1.5 2>&1)
	printf "Testing program with non integer arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with empty arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH "" 2>&1)
	printf "Testing program with empty arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Test program with multiple arguments
	RESULT=$(./$PUSH_SWAP_PATH "1 2 3 4 5" "6 7 8" | wc -l | tr -d ' ')
	printf "Testing program with multiple arguments: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing program with multiple arguments and duplicate arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH "1 2 3 4 5" "6 7 8" "1 2 3 4 5" 2>&1)
	printf "Testing program with multiple arguments and duplicate arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing int max	
	RESULT=$(./$PUSH_SWAP_PATH 2147483647 | wc -l | tr -d ' ')
	printf "Testing int max: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing int min
	RESULT=$(./$PUSH_SWAP_PATH -2147483648 | wc -l | tr -d ' ')
	printf "Testing int min: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing int max + 1 (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 2147483648 2>&1)
	printf "Testing int max + 1: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing int min - 1 (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH -2147483649 2>&1)
	printf "Testing int min - 1: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing numbers with zeros at the beginning (must work)
	RESULT=$(./$PUSH_SWAP_PATH 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 | wc -l | tr -d ' ')
	printf "Testing numbers with zeros at the beginning: "
	if [ $RESULT -eq 0 ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing numbers with zeros at the beginning and duplicate arguments (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 000 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 2>&1)
	printf "Testing numbers with zeros at the beginning and duplicate arguments: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi

	# Testing if big numbers overflow (must return : Error in standard error)
	RESULT=$(./$PUSH_SWAP_PATH 10000000000000000000000000000000000000000000000000000000000000000 2>&1)
	printf "Testing if big numbers overflow: "
	if [ "$RESULT" == "Error" ]; then
		printf "${GREEN_BACKGROUND} SUCCESS ${NC}\n"
	else
		printf "${RED_BACKGROUND} FAILURE ${NC}\n"
	fi
}

# Main
print_message
clean_error_cases
device

# Check if first parameter is equal to "clean"
if [ $1 == "clean" ]; then
	clean_error_cases
	printf "${GREEN_BACKGROUND} SUCCESS ${NC} : error cases cleaned\n"
	exit 0
fi

# Check if first parameter is equal to "parsing"
if [ $1 == "parsing" ]; then
	printf "${GREEN_BACKGROUND} Testing parsing ${NC}\n"
	parsing_tester
	exit 0
fi

# Check if first parameter is equal to "help"
if [ $1 == "help" ]; then
	printf "${GREEN_BACKGROUND} HELP ${NC}\n\n"
	printf "${BLUE_BACKGROUND} USAGE ${NC} :\n"
	printf "\t ./tester.sh [FIRST PARAMETER] [SECOND PARAMETER]\n\n"
	printf "${BLUE_BACKGROUND} FIRST PARAMETER ${NC} :\n"
	printf "\t number of arguments : number of arguments to generate\n"
	printf "\t parsing : test parsing\n"
	printf "\t clean : clean error cases\n"
	printf "\t help : show help\n\n"
	printf "${BLUE_BACKGROUND} SECOND PARAMETER ${NC} :\n"
	printf "\t number of tests : number of tests to run\n\n"
	printf "${BLUE_BACKGROUND} EXAMPLE ${NC} :\n"
	printf "\t ./tester.sh 100 1000\n"
	printf "\t ./tester.sh clean\n"
	printf "\t ./tester.sh parsing\n"
	printf "\t ./tester.sh help\n\n"
	exit 0
fi

# Check input
if [ $# -ne 2 ]; then
	printf "${RED_BACKGROUND} USAGE ${NC} : ./tester.sh [number of random numbers] [number of tests]\n"
	exit 1
fi

# Check if push_swap exist
if [ ! -f $PUSH_SWAP_PATH ]; then
	# Compile push_swap
	make -C ../
	# Check if push_swap exist
	if [ ! -f $PUSH_SWAP_PATH ]; then
		printf "${RED_BACKGROUND} ERROR ${NC} : push_swap not found\n"
		exit 1
	fi
fi

# Check if checker exist
if [ ! -f $CHECKER_PATH ]; then
	printf "${RED_BACKGROUND} ERROR ${NC} : checker not found\n"
	exit 1
fi

# Check if number of random numbers is a number
if ! [[ $NUMBER_OF_ARGUMENTS =~ ^[0-9]+$ ]]; then
	printf "${RED_BACKGROUND} ERROR ${NC} : invalid number of random numbers\n"
	exit 1
fi

# Check if number of tests is a number
if ! [[ $NUMBER_OF_TESTS =~ ^[0-9]+$ ]]; then
	printf "${RED_BACKGROUND} ERROR ${NC} : invalid number of tests\n"
	exit 1
fi

# Run tests
for ((i = 0; i < $NUMBER_OF_TESTS; i++)); do
	tester $NUMBER_OF_ARGUMENTS
done

# Print results
at_exit
