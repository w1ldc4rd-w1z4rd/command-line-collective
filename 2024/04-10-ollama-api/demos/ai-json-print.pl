#!/usr/bin/env perl -n

# prints response only from ollama

use JSON::XS;

$|++;

my $data = decode_json $_;

print $data->{response};

__END__
# demo request

curl -sSL -N -X POST http://localhost:11434/api/generate \
-H "Content-Type: application/json" \
-d '{"model": "Mistral", "prompt": "[INST] Generate a valid JSON object from the following data: name: John, lastname: Smith, address: #1 Samuel St. [/INST]"}' | perl ./ai-json-print.pl

# output
{
	"name": "John",
	 "lastname": "Smith",
	 "address":
	 {
	   "streetAddress": "#1 Samuel St."
	 }
}
