// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract monitoringAuthority{
    struct Organization{
        uint256 orgNo;      //inside a consortium: 0,1,2,3...
        uint256 regCode;    //Std code alloted to org while regestration: 456,789,...
        address id;          //Wallet add
        uint64[19] checkList;    //Binary list
    }

    uint64[19] checkListInitially = [uint64(0)];

    Organization[] private organizations;

    function createOrg(uint256 _regCode, address _id) public {
        Organization memory newOrg = Organization({
            orgNo: organizations.length,
            regCode: _regCode,
            id: _id,
            checkList: checkListInitially
        });
        organizations.push(newOrg);
    }
    
    function getOrg(uint256 _orgNo) external view returns(uint256, uint256, address, uint64[19] memory){
        return(
            organizations[_orgNo-1].orgNo,
            organizations[_orgNo-1].regCode,
            organizations[_orgNo-1].id,
            organizations[_orgNo-1].checkList
        );
    }

    function getOrgAudit(uint256 _orgNo) external view returns(uint64[19] memory){
        return(
            organizations[_orgNo-1].checkList
        );
    }


    function stepCompleted(uint256 _orgNo,  uint64 _index) public{
        require(_orgNo<=organizations.length, "Organization does'nt exist.");
        require(msg.sender == organizations[_orgNo-1].id, "Please enter correct organization address"); //keccak256(abi.encodePacked(_id))
        // require(Strings.toHexString(uint256(uint160(msg.sender)), 20) == organizations[_orgNo-1].id), "Please enter correct organization address"); //keccak256(abi.encodePacked(_id))
        organizations[_orgNo-1].checkList[_index] = 1;

    }

}