# This jq file is used to process openapi-extract.json into a proper
# OpenAPI spec.

# This "spec" has array items as a list instead of an object. I have
# no idea why. Here, we walk the whole spec and replace any entry with
# key "items" and an array value with the first element of the array.
walk(if (.|type) == "object" and .items? and (.items|type) == "array" then .items = .items[0] else . end)

# The "/{api}" path is underspecified. It's custom anyway. Just get
# rid of it.
| del(.paths["/{api}"])

# The various analyze endpoints are missing an important field in
# their response, "resolvedPageUrl". Add it.
| .paths["/analyze"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/article"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/product"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/discussion"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/job"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/image"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/video"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/list"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}
| .paths["/event"].get.responses["200"].content["application/json"].schema.properties.objects.items.properties.resolvedPageUrl = {"type": "string"}

# This "spec" is v3.1.0, but tooling only really takes v3.0.x at the
# moment. Just rewrite the version.
|.openapi="3.0.3"