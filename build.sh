#!/bin/bash

sqlite-utils insert manatees.db locations \
  Manatee_Carcass_Recovery_Locations_in_Florida.csv --csv -d

sqlite-utils transform manatees.db locations \
  --rename LAT latitude \
  --rename LONG_ longitude \
  --drop created_user \
  --drop last_edited_user \
  --drop X \
  --drop Y \
  --drop STATE \
  --drop OBJECTID \
  --pk FIELDID

sqlite-utils convert manatees.db locations \
  REPDATE created_date last_edited_date \
  'r.parsedatetime(value)'

