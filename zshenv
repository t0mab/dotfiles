function activate () {
	python="python2.7"

	cd $(git rev-parse --show-toplevel)
	repository=${$(git rev-parse --show-toplevel)##*/}

	if [ ! -d "$WORKON_HOME/$repository" ]; then
		if [ -f requirements.txt ]; then
			mkvirtualenv -p $python -r requirements.txt $repository
		else
			mkvirtualenv -p $python $repository
		fi
	fi

	workon $repository
}

function pull-them-all () {
	for repos in *; do
		echo $repos
		echo '-------'
		cd $repos
		git pull --all
		cd ..
	done
}

function pgrights () {
	database=$1
	user=$2

	for table in $(echo "select tablename from pg_catalog.pg_tables where schemaname='public';" | sudo -u postgres psql -qtXA $database); do
		echo "ALTER TABLE $table OWNER TO $user;" | sudo -u postgres psql $database
	done
}
