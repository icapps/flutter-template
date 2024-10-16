CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

echo What is the current database version?
read version

fvm dart run drift_dev schema dump lib/database/flutter_template_database.dart test/database/drift_schemas/drift_schema_v$version.json
fvm dart run drift_dev schema generate test/database/drift_schemas/ test/database/schema_versions
