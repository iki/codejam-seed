@set src=gcj_init_contest
@set dst=gcj_clear_contest gcj_download_input gcj_get_status gcj_renew_login gcj_submit_solution

@for %%d in (%dst%) do copy %src% %%d
@for %%d in (%dst%) do copy %src%.bat %%d.bat

@set src=gcj-a
@set dst=gcj-b gcj-c

@for %%d in (%dst%) do copy %src%.bat %%d.bat

