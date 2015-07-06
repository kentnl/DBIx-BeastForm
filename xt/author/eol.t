use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::EOL 0.18

use Test::More 0.88;
use Test::EOL;

my @files = (
    'lib/DBIx/BeastForm.pm',
    'lib/DBIx/BeastForm/Col.pm',
    'lib/DBIx/BeastForm/Connected.pm',
    'lib/DBIx/BeastForm/DB.pm',
    'lib/DBIx/BeastForm/DB/Disconnected.pm',
    'lib/DBIx/BeastForm/DBIL.pm',
    'lib/DBIx/BeastForm/DBIL/Builder/Dynamic.pm',
    'lib/DBIx/BeastForm/DBIL/Schema.pm',
    'lib/DBIx/BeastForm/DBIL/Table.pm',
    'lib/DBIx/BeastForm/Driver.pm',
    'lib/DBIx/BeastForm/Introspective.pm',
    'lib/DBIx/BeastForm/ResultSet.pm',
    'lib/DBIx/BeastForm/Role/Builder.pm',
    'lib/DBIx/BeastForm/Role/Connected.pm',
    'lib/DBIx/BeastForm/Role/DBIL.pm',
    'lib/DBIx/BeastForm/Role/Introspective.pm',
    'lib/DBIx/BeastForm/Table.pm',
    'lib/DBIx/BeastForm/Util.pm',
    't/00-compile/lib_DBIx_BeastForm_Col_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Connected_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DBIL_Builder_Dynamic_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DBIL_Schema_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DBIL_Table_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DBIL_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DB_Disconnected_pm.t',
    't/00-compile/lib_DBIx_BeastForm_DB_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Driver_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Introspective_pm.t',
    't/00-compile/lib_DBIx_BeastForm_ResultSet_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Role_Builder_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Role_Connected_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Role_DBIL_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Role_Introspective_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Table_pm.t',
    't/00-compile/lib_DBIx_BeastForm_Util_pm.t',
    't/00-compile/lib_DBIx_BeastForm_pm.t',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/beastform.t',
    't/connected.t',
    't/db.t',
    't/dbil.t',
    't/introspective.t'
);

eol_unix_ok($_, { trailing_whitespace => 1 }) foreach @files;
done_testing;
