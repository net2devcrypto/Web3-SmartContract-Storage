// SPDX-License-Identifier: MIT LICENSE

/*
N2D Sample Struct Smart Contract

Follow/Subscribe Youtube, Github, IM, Tiktok
for more amazing content!!
@Net2Dev
███╗░░██╗███████╗████████╗██████╗░██████╗░███████╗██╗░░░██╗
████╗░██║██╔════╝╚══██╔══╝╚════██╗██╔══██╗██╔════╝██║░░░██║
██╔██╗██║█████╗░░░░░██║░░░░░███╔═╝██║░░██║█████╗░░╚██╗░██╔╝
██║╚████║██╔══╝░░░░░██║░░░██╔══╝░░██║░░██║██╔══╝░░░╚████╔╝░
██║░╚███║███████╗░░░██║░░░███████╗██████╔╝███████╗░░╚██╔╝░░
╚═╝░░╚══╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░╚══════╝░░░╚═╝░░░
THIS CONTRACT IS AVAILABLE FOR EDUCATIONAL 
PURPOSES ONLY. YOU ARE SOLELY REPONSIBLE 
FOR ITS USE. I AM NOT RESPONSIBLE FOR ANY
OTHER USE. THIS IS TRAINING/EDUCATIONAL
MATERIAL. ONLY USE IT IF YOU AGREE TO THE
TERMS SPECIFIED ABOVE.
*/

pragma solidity 0.8.7;


contract userDB {

    struct userInfo{
        string firstname;
        string lastname;
        string username;
        string email;
    }

    mapping (uint256 => mapping(address => userInfo)) public membership;

    function saveUser(address wallet, uint256 memId,
    string memory first, 
    string memory last, 
    string memory user, 
    string memory email) external {
        membership[memId][wallet].firstname = first;
        membership[memId][wallet].lastname = last;
        membership[memId][wallet].username = user;
        membership[memId][wallet].email = email;

    }


    function updateUser(address wallet, uint256 memId, uint256 option, string memory data) external {
        if (option == 0) {
            membership[memId][wallet].firstname = data;
        }
        else if (option == 1) {
            membership[memId][wallet].lastname = data;
        }
        else if (option == 2) {
            membership[memId][wallet].username = data;
        }
        else if (option == 3) {
            membership[memId][wallet].email = data;
        }

    }

     function removeUser(address wallet, uint256 memId) external {
            delete membership[memId][wallet];
    }

}