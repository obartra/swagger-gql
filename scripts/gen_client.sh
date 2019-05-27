#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname $0)
ROOTDIR="$BASEDIR/.."
ASSETSDIR="$ROOTDIR/assets"
GENERATEDDIR="$ROOTDIR/generated"

mkdir -p $ASSETSDIR
mkdir -p $GENERATEDDIR

swaggerURL="http://petstore.swagger.io/v2/swagger.json"
swaggerPath="$ASSETSDIR/swagger-codegen-cli.jar"

# If wget does not exist, install it
if ! type "wget" > /dev/null; then
  echo "Installing wget..."
  brew install wget
fi

# If swagger-codegen does not exist, download it
if [ ! -f $swaggerPath ]; then
    echo "Downloading swagger-codegen..."
    wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.5/swagger-codegen-cli-2.4.5.jar -O $swaggerPath
fi

# Run swagger-codegen
java -jar $swaggerPath generate \
   -i $swaggerURL \
   -l typescript-fetch \
   -o $GENERATEDDIR