# Push_swap Tester

## Table of contents
- [Push\_swap Tester](#push_swap-tester)
	- [Table of contents](#table-of-contents)
	- [Description](#description)
	- [Usage](#usage)
	- [Testing example](#testing-example)
	- [Output](#output)
- [Oh wait, there is more](#oh-wait-there-is-more)
	- [Contact](#contact)
	- [License](#license)
  
## Description
This tester is designed to test the push_swap project from the 42 / 1337 school. It will assess your push_swap program with various inputs and provide the result of each test along with the average of all the tests.

## Usage
To use this tester, clone it in the same directory as your push_swap program. Then, run the tester with the following command:
```bash
git clone https://github.com/bablilayoub/push_swap_tester.git && cd push_swap_tester
```

## Testing example
```bash
./tester.sh 100 100
```
This will execute 100 tests, each with 100 random numbers.

## Output
The tester's output will resemble the following:

```bash
Test case : 1 | STATUS:  KO  | Number of instructions: 531
```
Or
```bash
Test case : 1 | STATUS:  OK  | Number of instructions: 656
```
Additionally, the tester will provide the average of all the tests at the end of the execution.

I have something else for you, you can also test parsing with this tester. Just use the following command:
```bash
./tester.sh parsing
```
This will test your program with various inputs, such as duplicate numbers, non-numeric arguments, empty arguments, etc.

# Oh wait, there is more
I understand that your session is getting full due to error files, so I added a clean option to the tester. Just use the following command:
```bash
./tester.sh clean
```
## Contact
If you have any questions about this tester, you can contact me on Discord: .thexd

## License
[MIT](https://choosealicense.com/licenses/mit/)

And that's it! I hope you enjoy this tester, and if you have any suggestions, please let me know.