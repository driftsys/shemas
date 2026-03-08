# Format all files
fmt:
    dprint fmt

# Check formatting without writing
check:
    dprint check

# Lint all files
lint:
    markdownlint '**/*.md'
    dprint check

# Validate schemas against their meta-schema
test:
    npx -p ajv-cli -p ajv-formats ajv compile --spec=draft7 -c ajv-formats -s project/v1.json

# Copy schema files to public/
publish:
    ./scripts/publish
