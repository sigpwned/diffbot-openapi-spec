all: openapi.json openapi.min.json

clean:
	rm -f *.json

# This is the "extract" set of endpoints
openapi-extract.json:
	curl -o openapi-extract.json https://docs.diffbot.com/openapi/638975592e00230010aaaa39

# The verbatim OpenAPI spec has a couple of issues:
#
# * It uses version 3.1.0 of the OpenAPI standard, but tooling only supports 3.0.x
# * Its array items schema types use array instead of object (no idea why)
# * It has an incompletely-specified "/{api}" endpoint
#
# We use jq to clean these issues up.
#
# Also, we're only handling the "extract" OpenAPI spec at this time.
openapi.json: openapi-extract.json
	cat openapi-extract.json | jq 'walk(if (.|type) == "object" and .items? and (.items|type) == "array" then .items = .items[0] else . end)|del(.paths["/{api}"])|.openapi="3.0.2"' >openapi.json

# Create a minified version, while we're in here
openapi.min.json: openapi.json
	cat openapi.json | jq -c >openapi.min.json
	
