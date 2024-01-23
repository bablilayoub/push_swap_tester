# Push_swap Tester

## Table of contents
- [Push\_swap Tester](#push_swap-tester)
	- [Table of contents](#table-of-contents)
	- [Description](#description)
	- [Usage](#usage)
	- [Example](#example)
	- [Output](#output)
- [Oh wait, there is more](#oh-wait-there-is-more)
	- [Contact](#contact)
	- [License](#license)
  
## Description
This tester is made to test the push_swap project from 42 / 1337 school, it will test your push_swap program with a lot of different inputs and will give you the result of each test and the average of all the tests.

## Usage
To use this tester you need to clone it in the same directory as your push_swap program, then you can run the tester with the following command:
```bash
git clone
cd push_swap_tester
./tester.sh [number of tests] [number of elements]
```

## Example
```bash
./tester.sh 100 100
```
This will run 100 tests with 100 random elements in each test.

## Output
The output of the tester will be something like this:
```bash
Test case : 1 | STATUS:  KO  | Number of instructions: 531
```
Or
```bash
Test case : 1 | STATUS:  OK  | Number of instructions: 656
```
The tester will also give you the average of all the tests at the end of the execution.

i have something else for you, you can also test parsing with this tester, just write the following command:
```bash
./tester.sh parsing
```
This will test your program with a lot of different inputs , such as : duplicate numbers, non numeric arguments, empty arguments, etc...

# Oh wait, there is more
i know you are angry because your session getting full because of error files, so i made a script that will delete all the error files, just write the following command:
```bash
./tester.sh clean
```
## Contact
If you have any questions about this tester, you can contact me on discord: .thexd

## License
[MIT](https://choosealicense.com/licenses/mit/)

```
And that's it, i hope you will enjoy this tester, and if you have any suggestions, please let me know.
```