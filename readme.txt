Deployment steps:

1. Deploy monitoringAuthority.sol first using an address.

2. Add organizations using "createOrg" function.
(_regCode is the registration code that the company is registered with,
_id is the wallet adderess of the organization)

3. Add steps in the binary arrays of the companys using "stepCompleted" function.
(_orgNo is the index number of the private array organizations. We have to remember that as of now,
_index is the index number of the task in the checklist which is completed. We can complete 1 task at a time. On completion 0 will be replaced by 1 in the binary array of size 19 which represents 19 checklist items)

4. We can get information about the organization using "getOrg" (here we have to input the _orgNo which is the same as explained in the above point. We have to remember that as of now)

5. We deploy auditGrade.sol on the same address (auth is the address of the monitoringAuthority.sol,
_orgNo is the same as above)


Flow summary:
deploy - monitoringAuthority.sol >> deploy - auditGrade.sol using same adderess