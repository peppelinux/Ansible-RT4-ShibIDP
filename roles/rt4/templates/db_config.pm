# THE DATABASE:
# generated by dbconfig-common

# map from dbconfig-common database types to their names as known by RT
my %typemap = (
    mysql   => 'mysql',
    pgsql   => 'Pg',
    sqlite3 => 'SQLite',
);

Set($DatabaseType, $typemap{mysql} || "UNKNOWN");

Set($DatabaseHost, 'localhost');
Set($DatabasePort, '3306');

Set($DatabaseAdmin, "{{ db_user }}");
Set($DatabaseAdminPassword , '{{ db_passwd }}');

Set($DatabaseUser , '{{ db_user }}');
Set($DatabasePassword , '{{ db_passwd }}');

# SQLite needs a special case, since $DatabaseName must be a full pathname
my $dbc_dbname = '{{ db_name }}'; if ( "mysql" eq "sqlite3" ) { Set ($DatabaseName, '' . '/' . $dbc_dbname); } else { Set ($DatabaseName, $dbc_dbname); }
