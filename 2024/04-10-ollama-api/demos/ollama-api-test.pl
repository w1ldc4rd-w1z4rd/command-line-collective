#!/usr/bin/env perl

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PACKAGE

package AI;

use feature qw|say|;
use warnings;
use JSON::XS;
use Term::ANSIColor qw|:constants|;
use feature qw|say|;
use LWP::UserAgent;
use HTTP::Request;

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SUB - AI API

sub api
{
	my $payload = shift;
	my $url = shift;
	my $cmd;
	
	my $json = JSON::XS->new->utf8;	
	my $ua   = LWP::UserAgent->new;
	
	$ua->timeout(300);
	my $json_data = encode_json($payload);
	
	my $request = HTTP::Request->new(POST => $url);
	$request->content_type('application/json');
	$request->content($json_data);
	
	my $response = $ua->request($request, sub 
	{
	    my ($chunk, $res) = @_;
	    my $response = $json->decode($chunk);
		print BOLD GREEN $response->{response}; 
		$cmd .= $response->{response}; 
	});
	
	if ($response->is_success) 
	{
		return $cmd;
	} 
	else 
	{
	    die RED BOLD "> request failed: " . $response->status_line . "\n", RESET;
	}
}

package main;

use feature qw|say|;

$|++;

my $prompt = "Write me a fantasy story!";

my $payload =
{
	model => 'mistral', 
	options => { num_ctx => 16384 },
	prompt => $prompt,
};

AI::api( $payload, 'http://localhost:11434/api/generate' );

1;