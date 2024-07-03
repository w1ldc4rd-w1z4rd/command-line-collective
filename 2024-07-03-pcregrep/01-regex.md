# PCRE Regex Essentials Guide

By: [w1ldc4rd-w1z4rd](https://github.com/w1ldc4rd-w1z4rd)

PCRE (Perl Compatible Regular Expressions) is a powerful regex flavor used in many programming languages and tools. This guide covers the essential elements of PCRE regex to help you construct effective patterns for text matching and manipulation.

## Basic Characters and Metacharacters

Literal Characters: Any character not listed below matches itself.

Metacharacters with special meanings:

```
. ^ $ * + ? { } [ ] \ | ( )
```

To match these metacharacters literally, escape them with a backslash.

**Example:**

```
\.com
```

## Character Classes

```
[ ] => Defines a character class. Matches any single character within the brackets.
[^] => Negated character class. Matches any single character not within the brackets.
```

**Example:**

```
[aeiou] matches a e i o u
[^0-9] matches 0 1 2 3 4 5 6 7 8 9
```

Predefined character classes:

```
\d => Digit [0-9]
\D => Non-digit [^0-9]
\w => Word character [a-zA-Z0-9_]
\W => Non-word character
\s => Whitespace (space, tab, newline)
\S => Non-whitespace
```

**Example:**

```
\d\w matches 9a
```

## Anchors and Boundaries

```
^ - Start of line
$ - End of line
\b - Word boundary
```

**Example:**

```
^\d\d\d$ => matches 123
\bcat\b => matches cat if spaces are around it
```

## Quantifiers

```
* => 0 or more occurrences
+ => 1 or more occurrences
? => 0 or 1 occurrence
{n} => Exactly n occurrences
{n,} => n or more occurrences
{n,m} => Between n and m occurrences
```

**Example:**

```
\d+ => matches 27139
colou?r => matches color and colour
\w{3,5} => matches 3 - 5 'word' characters
```

## Grouping and Capturing

```
( ) => Groups expressions and creates a capturing group
(?:) => Non-capturing group
```

**Example:**

```
(ab)+c => captures ab to $1
(?:https?):// => for organization
```

## Alternation

```
| => Alternation (OR operator)
```

**Example:**

```
cat|dog => cat or dog
(?:https?|ftp):// => https, http or ftp
```

## Lookaround Assertions

```
(?=) => Positive lookahead
(?!) => Negative lookahead
(?<=) => Positive lookbehind
(?<!) => Negative lookbehind
```

**Example:**

```
cats(?= are best) => matches Cats if 'are best'
cats(?! are bad) => matches cats unless 'are bad'
(?=yes )cats => matches cats if yes preceeds
(?!no )cats => matches cats if not no proceeds
```

## Modifiers

```
(?i) => Case-insensitive matching
```

**Example:**

```
(?i)hello => matches lower and upper case hello, example = hElLO
```

## Tips for Efficient PCRE Usage

- Start with simpler patterns and gradually add complexity.
- Use non-capturing groups (?:) when you don't need to capture the matched content.
- Be cautious with greedy quantifiers (* and +) in complex patterns.
- Use anchors (^ and $) to match whole lines or words precisely.
- Test your regex patterns with tools like [regex101.com](https://regex101.com) for PCRE.
- Use lookaround assertions for complex matching without consuming characters.
