set src=gcj-init-contest
set dst=gcj-clear-contest gcj-download-input gcj-get-status gcj-renew-login gcj-submit-solution

for %%d in (%dst%) do copy %src% %%d
for %%d in (%dst%) do copy %src%.bat %%d.bat