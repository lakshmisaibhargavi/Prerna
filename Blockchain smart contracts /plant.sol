pragma solidity ^0.6.10;

contract Prerna{
    
    struct details{
        string name;
        string loc;
        string date;
        string dataref;
        string imei;
        string addPlantDDMMYYYY;
    }
    
    mapping (string => details) individualFile;
    
    function individual(string memory Name,string memory loc, string memory dataref, string memory Imei, string memory AddPlantDDMMYYYY) public{
        details memory Person;
        Person.name=Name;
        Person.loc = loc;
        Person.dataref=dataref;
        Person.imei=Imei;
        Person.addPlantDDMMYYYY=AddPlantDDMMYYYY;
        individualFile[Imei]=Person;
    }
    
    function PersonDetails(string memory Imei) public view returns (string memory PersonName,string memory Personloc,string memory Persondataref, string memory Add_Plant_DDMMYYYY){
        details memory Person = individualFile[Imei];
        PersonName=Person.name;
        Personloc=Person.loc;
        Persondataref=Person.dataref;
        Add_Plant_DDMMYYYY=Person.addPlantDDMMYYYY;
        return(PersonName,Personloc,Persondataref,Add_Plant_DDMMYYYY);
        
    }
     
}