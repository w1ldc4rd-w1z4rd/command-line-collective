# PCRE grep Guide

## Introduction

PCRE grep (pcregrep) is a powerful command-line utility that uses Perl-compatible regular expressions (PCRE) for pattern matching in files. It's particularly useful for complex searches and multiline pattern matching.

## Installation

On Debian-based systems, you can install pcregrep using the following commands:

```bash
sudo apt update
sudo apt install pcregrep
```

## Basic Syntax

The basic syntax for using pcregrep is:

```bash
pcregrep [options] [pattern] [files]
```

## Key Features and Options

Basic Search: To perform a simple search, use pcregrep with a pattern and file name. For example:

```bash
pcregrep 'apple' fruits.txt
```

This command will output lines containing 'apple', such as:

```
red apple
green apple
apple pie
```

Multiline Matching: Use the -M option for multiline matching. This is useful when you need to match patterns that span across multiple lines:

```bash
pcregrep -M 'start.*(\n|.)*?end' document.txt
```

The output might look like:

```
start of paragraph
This is some text in between.
It can span multiple lines.
end of paragraph
```

List Files with Matches: The -l option lists only the names of files containing matches:

```bash
pcregrep -l 'error' log1.txt log2.txt log3.txt
```

This will output the names of files containing the word 'error', such as:

```
log1.txt
log3.txt
```

Show Only Matching Parts: Use -o to display only the matched parts of lines:

```bash
pcregrep -o '\b\d{3}-\d{3}-\d{4}\b' contacts.txt
```

This will extract phone numbers in the format XXX-XXX-XXXX:

```
123-456-7890
987-654-3210
```

Case-Insensitive Search: The -i option performs a case-insensitive search:

```bash
pcregrep -i 'hello' greetings.txt
```

This will match 'hello' regardless of case:

```
Hello World
hello there
HELLO EVERYONE
```

Invert Match: Use -v to invert the match, showing lines that don't match the pattern:

```bash
pcregrep -v '^#' config.ini
```

This will show lines not starting with #:

```
server_name = example.com
port = 8080
debug = true
```

Count Matches: The -c option counts the number of matching lines:

```bash
pcregrep -c 'error' system.log
```

This will output the count of lines containing 'error', e.g., 42.

Recursive Search: Use -r for recursive search in directories:

```bash
pcregrep -r 'TODO' src/
```

This will search for 'TODO' in all files under the src/ directory:

```
src/main.c:15: // TODO: Implement error handling
src/utils.h:42: /* TODO: Optimize this function */
```

## Advanced Features

PCRE2 Mode: The -P option enables PCRE2 mode for advanced Unicode support:

```bash
pcregrep -P '\p{Lu}' names.txt
```

This will match lines with uppercase letters:

```
John Doe
Alice Smith
ROBERT JOHNSON
```

Null-Separated Input: Use -z to treat input as null-terminated lines:

```bash
pcregrep -z 'password' database.bin
```

This is useful for searching in binary files.

Colorized Output: The --color option highlights matches in color:

```bash
pcregrep --color 'important' report.txt
```

This will highlight 'important' in the output.

Context Lines: Use -A, -B, or -C to show context lines around matches:

```bash
pcregrep -C 1 'error' application.log
```

This shows one line before and after each match:

```
[2023-05-01 10:15:30] Application started
[2023-05-01 10:15:31] Error: Database connection failed
[2023-05-01 10:15:32] Retrying connection...
```

## Interesting Tricks

Finding Duplicate Lines: Use this pattern to find consecutive duplicate lines:

```bash
pcregrep -Mn '^(.*)$\n\1$' data.txt
```

Email Address Extraction: Extract email addresses with this pattern:

```bash
pcregrep -o '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}' contacts.txt
```

URL Extraction: Extract URLs from a file:

```bash
pcregrep -o 'https?://[^\s]+' webpage.html
```

Finding Lines with Specific Length: Find lines of exact length:

```bash
pcregrep '^.{80}$' code.txt
```

Matching Balanced Parentheses: Match expressions with balanced parentheses:

```bash
pcregrep -M '(\((?:[^()]++|(?1))*\))' expressions.txt
```

