# Usage:
# make        # create README.md file
# make delete  # delete the README.md file created

.PHONY: generate_readme

all: generate_readme

generate_readme: guessinggame.sh
	@echo "Generating README.md file for the Guessing Game bash script"	
	@touch README.md
	@echo "# Guessing Game Bash Script - The Unix Workbench" > README.md
	@echo >> README.md
	@echo "Made run at : " >> README.md
	@today="Make was run at $(date)"
	@date >> README.md
	@echo >> README.md
	@echo "The number of lines of code contained in guessinggame.sh : " >> README.md
	@wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md
	@echo "README.md file has been successfully created"

delete:
	@echo "README.md has been deleted"
	@rm *.md