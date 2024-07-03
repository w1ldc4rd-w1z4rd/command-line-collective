# PCRE Regex Essentials Guide

PCRE (Perl Compatible Regular Expressions) is a powerful regex flavor used in many programming languages and tools. This guide covers the essential elements of PCRE regex to help you construct effective patterns for text matching and manipulation.

## Basic Characters and Metacharacters

Literal Characters: Any character not listed below matches itself.

**Metacharacters with special meanings:**

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
[ ] - Defines a character class. Matches any single character within the brackets.
[^] - Negated character class. Matches any single character not within the brackets.
```

**Example:**

```
[aeiou]
[^0-9]
```

Predefined character classes:

```
\d - Digit [0-9]
\D - Non-digit [^0-9]
\w - Word character [a-zA-Z0-9_]
\W - Non-word character
\s - Whitespace (space, tab, newline)
\S - Non-whitespace
```

**Example:**

```
\d{3}-\w+
```

## Anchors and Boundaries

```
^ - Start of line
$ - End of line
\b - Word boundary
\B - Non-word boundary
```

**Example:**

```
^\d{3}$
\bcat\b
```

## Quantifiers

```
* 0 or more occurrences
+ 1 or more occurrences
? - 0 or 1 occurrence
{n} - Exactly n occurrences
{n,} - n or more occurrences
{n,m} - Between n and m occurrences
```

**Example:**

```
\d+
colou?r
\w{3,5}
```

## Grouping and Capturing

```
( ) - Groups expressions and creates a capturing group
(?:) - Non-capturing group
```

**Example:**

```
(ab)+c
(?:https?|ftp)://
```

## Alternation

```
| - Alternation (OR operator)
```

**Example:**

```
cat|dog
(red|blue|green)
```

## Lookaround Assertions

```
(?=) - Positive lookahead
(?!) - Negative lookahead
(?<=) - Positive lookbehind
(?<!) - Negative lookbehind
```

**Example:**

```
\b\w+(?=ing\b)
(?<=\$)\d+(\.\d{2})?
```

## Modifiers

```
(?i) - Case-insensitive matching
(?m) - Multiline mode (^ and $ match start/end of each line)
(?s) - Dot matches newline
```

**Example:**

```
(?i)hello
(?m)^start
```

## Escaping Special Characters

```
Use \ to escape special characters when you want to match them literally.
```

**Example:**

```
\[literal\]
```

## Advanced PCRE Features

```
Recursive Patterns:
(?R) - Recursive match of the entire pattern

Conditional Patterns:
(?(condition)then|else)

Named Capturing Groups:
(?<name>...) or (?'name'...)
```

**Example:**

```
(?<word>\w+)\s+\k<word>
```

## Tips for Efficient PCRE Usage

- Start with simpler patterns and gradually add complexity.
- Use non-capturing groups (?:) when you don't need to capture the matched content.
- Be cautious with greedy quantifiers (* and +) in complex patterns.
- Use anchors (^ and $) to match whole lines or words precisely.
- Test your regex patterns with tools like [regex101.com](https://regex101.com) for PCRE.
- Use lookaround assertions for complex matching without consuming characters.
