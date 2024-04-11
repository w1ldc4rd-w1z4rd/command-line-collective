#!/usr/bin/env perl

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PRAGMAS

use warnings;
use JSON::XS;
use Term::ANSIColor qw|:constants|;
use LWP::UserAgent;
use HTTP::Request;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ INIT

$|++;

my $prompt = "Write me a fantasy story!";

my $payload =
{
	model => 'mistral', 
	options => { num_ctx => 16384 },
	prompt => $prompt,
};

api( $payload, 'http://localhost:11434/api/generate' );

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SUB

sub api
{
	my $payload = shift;
	my $url = shift;
	my $output;
	
	my $json = JSON::XS->new->utf8;	
	my $ua   = LWP::UserAgent->new;
	
	$ua->timeout(300);
	my $json_data = encode_json( $payload );
	
	my $request = HTTP::Request->new( POST => $url );
	$request->content_type( 'application/json' );
	$request->content( $json_data );
	
	my $response = $ua->request( $request, sub 
	{
		my ($chunk, $res) = @_;
		my $response = $json->decode( $chunk );
		print BOLD GREEN $response->{response}, RESET; 
	} );
	
	unless ( $response->is_success ) 
	{
	    die RED BOLD "> request failed: " . $response->status_line . "\n", RESET;
	}
}

