# Group Policy

## Update policies:

gpupdate /force

## Show applied Computer GPOs:

gpresult /scope computer /r

## Show applied User GPOs:

gpresult /scope user /r

## Generate HTML report:

gpresult /h GPReport.html