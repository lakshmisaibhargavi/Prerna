pragma solidity ^0.6.3;

contract prerna{
    struct details{
        string img;
        string user;
        string imei;
        int userno;
    }
    
    mapping(string=>details) file;
    
    function idetails( string memory imgname, string memory username, string memory imeino, int usercount) public {
        details memory person;
        person.img=imgname;
        person.user=username;
        person.imei=imeino;
        person.userno=usercount;
        file[imeino]=person;
    }
    
    function PersonDetails(string memory imeino) public view returns(string memory Image, string memory user_name, string memory imei_number, int user_count){
        details memory person = file[imeino];
        Image=person.img;
        user_name=person.user;
        imei_number=person.imei;
        user_count=person.userno;
        return(Image, user_name, imei_number,user_count);
    }
}