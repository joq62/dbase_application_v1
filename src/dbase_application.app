%% This is the application resource file (.app file) for the 'base'
%% application.
{application, dbase_application,
[{description, "dbase_application" },
{vsn, "1.0.0" },
{modules, 
	  [dbase_application_app,dbase_application_sup,dbase_application,db_dbase_application]},
{registered,[dbase_application]},
{applications, [kernel,stdlib]},
{mod, {dbase_application_app,[]}},
{start_phases, []}
]}.
