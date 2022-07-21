//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import './monitoringAuthority.sol';



contract auditGrade{
    uint64[19] check_list;
    uint64 counter=0;
    
    function accessSteps(address auth, uint256 _orgNo) external returns(string memory){
        check_list = monitoringAuthority(auth).getOrgAudit(_orgNo);
        for(uint i=0;i<check_list.length;i++){
            if(check_list[i]==1){
                counter++;
            }
        }
        if(counter>=12){
            return("Grade: A");
        }
        else if(counter<12 && counter>=8){
            return("Grade: B");
        }
        else{
            return("Grade: C");
        }
    }




    // function getGrade(uint256 _orgNo) external returns(string memory){
    //     monitoringAuthority status;
    //     check_list = status.getOrgAudit(_orgNo);
        
    // }
}