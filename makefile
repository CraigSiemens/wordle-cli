.PHONY: clean readme

WORDLE_BINARY = ./.build/release/wordle
wordle:
	swift build --disable-automatic-resolution --configuration release
	cp "$(WORDLE_BINARY)" ./

clean:
	rm wordle

readme: wordle
	echo '# Wordle CLI' > README.md
	echo 'An implementation of Wordle implemented in Swift that cam be played on a command line.' >> README.md
	echo '```' >> README.md
	./wordle -h >> README.md
	echo '```' >> README.md
