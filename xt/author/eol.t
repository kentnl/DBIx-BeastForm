use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::EOL 0.18

use Test::More 0.88;
use Test::EOL;

my @files = (
    'lib/BeastForm.pm',
    'lib/BeastForm/Check.pm',
    'lib/BeastForm/DB.pm',
    'lib/BeastForm/Driver.pm',
    'lib/BeastForm/FK.pm',
    'lib/BeastForm/Field.pm',
    'lib/BeastForm/Fieldset.pm',
    'lib/BeastForm/Key.pm',
    'lib/BeastForm/Proc.pm',
    'lib/BeastForm/Reader/SQLT.pm',
    'lib/BeastForm/Reader/SQLT/Field.pm',
    'lib/BeastForm/Reader/SQLT/Index.pm',
    'lib/BeastForm/Reader/SQLT/Proc.pm',
    'lib/BeastForm/Reader/SQLT/Schema.pm',
    'lib/BeastForm/Reader/SQLT/Table.pm',
    'lib/BeastForm/Reader/SQLT/Trigger.pm',
    'lib/BeastForm/Reader/SQLT/View.pm',
    'lib/BeastForm/Role/Awesome.pm',
    'lib/BeastForm/Role/Connected.pm',
    'lib/BeastForm/Role/Constraint.pm',
    'lib/BeastForm/Role/DBIL.pm',
    'lib/BeastForm/Role/Introspective.pm',
    'lib/BeastForm/Role/Process.pm',
    'lib/BeastForm/Schema.pm',
    'lib/BeastForm/Table.pm',
    'lib/BeastForm/Trigger.pm',
    'lib/BeastForm/Util.pm',
    'lib/BeastForm/View.pm',
    'lib/BeastForm/Writer/DBIL/Dynamic/Schema.pm',
    'lib/BeastForm/Writer/DBIL/Dynamic/Table.pm',
    'lib/_attic/Awesome.pm',
    'lib/_attic/Col.pm',
    'lib/_attic/DBIL/Table.pm',
    't/00-compile/lib_BeastForm_Check_pm.t',
    't/00-compile/lib_BeastForm_DB_pm.t',
    't/00-compile/lib_BeastForm_Driver_pm.t',
    't/00-compile/lib_BeastForm_FK_pm.t',
    't/00-compile/lib_BeastForm_Field_pm.t',
    't/00-compile/lib_BeastForm_Fieldset_pm.t',
    't/00-compile/lib_BeastForm_Key_pm.t',
    't/00-compile/lib_BeastForm_Proc_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Field_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Index_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Proc_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Schema_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Table_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_Trigger_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_View_pm.t',
    't/00-compile/lib_BeastForm_Reader_SQLT_pm.t',
    't/00-compile/lib_BeastForm_Role_Awesome_pm.t',
    't/00-compile/lib_BeastForm_Role_Connected_pm.t',
    't/00-compile/lib_BeastForm_Role_Constraint_pm.t',
    't/00-compile/lib_BeastForm_Role_DBIL_pm.t',
    't/00-compile/lib_BeastForm_Role_Introspective_pm.t',
    't/00-compile/lib_BeastForm_Role_Process_pm.t',
    't/00-compile/lib_BeastForm_Schema_pm.t',
    't/00-compile/lib_BeastForm_Table_pm.t',
    't/00-compile/lib_BeastForm_Trigger_pm.t',
    't/00-compile/lib_BeastForm_Util_pm.t',
    't/00-compile/lib_BeastForm_View_pm.t',
    't/00-compile/lib_BeastForm_Writer_DBIL_Dynamic_Schema_pm.t',
    't/00-compile/lib_BeastForm_Writer_DBIL_Dynamic_Table_pm.t',
    't/00-compile/lib_BeastForm_pm.t',
    't/00-compile/lib__attic_Awesome_pm.t',
    't/00-compile/lib__attic_Col_pm.t',
    't/00-compile/lib__attic_DBIL_Table_pm.t',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/beastform.t',
    't/check.t',
    't/db.t',
    't/driver.t',
    't/field.t',
    't/fk.t',
    't/key_fieldset.t',
    't/proc.t',
    't/reader_sqlt_dbi.t',
    't/schema.t',
    't/table.t',
    't/trigger.t',
    't/util.t',
    't/view.t',
    't/writer_dbil_dynamic.t'
);

eol_unix_ok($_, { trailing_whitespace => 1 }) foreach @files;
done_testing;
