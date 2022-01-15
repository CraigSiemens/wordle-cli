.PHONY: clean readme

WORDLE_BINARY = ./.build/release/wordle
WORDLE_SOURCES = $(shell find ./Sources -type f -name "*.swift" | sed 's: :\\ :g')
wordle: Package.swift Package.resolved $(WORDLE_SOURCES)
	swift build --disable-automatic-resolution --configuration release
	cp "$(WORDLE_BINARY)" ./

clean:
	rm -f wordle

readme: wordle
	echo '# Wordle CLI' > README.md
	echo 'An implementation of Wordle implemented in Swift that can be played on the command line.' >> README.md
	echo '```' >> README.md
	./wordle -h >> README.md
	echo '```' >> README.md
