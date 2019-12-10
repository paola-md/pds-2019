cd ./../moma

./moma.py create-schemas
echo "Schemas created"

./moma.py create-raw-tables
echo "Raw tables greated"

./moma.py load-moma
echo "Data Loaded"

./moma.py create_clean_tables
echo "Clean tables created"

./moma.py create_semantic_tables
echo "Semantic tables created"

./moma.py create-cohort
echo "Cohort created"

./moma.py create-labels
echo "Labels created"

#./moma.py create-features
echo "Features created"