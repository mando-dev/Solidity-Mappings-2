//"SPDX-License-Identifier: <SPDX-License>"
pragma solidity ^0.6.0;

contract MyContract {                                           //mapping is a look-up
         mapping(uint => string) public names;                  //doing a mapping of names. names will b in string data type. names is the name of our mapping , unint for storing integers such as name 1, name 2 etc
         mapping(uint => Book) public books;                    //creating a mapping of these books below. doing id of uint. think of this as a database where you can look things up with an id search. 
         mapping(address => mapping(uint => Book)) public myBooks;   //we are gonna model all the books that belong to us or someone else. 2nd mapping is a books mapping. we can assign book id to specific users based on chain address.This is basically saying pass my address and get all my books based with my id 
                                                                    //first making key would be chain address
         struct Book {                                          //structs are a way to create your own datastructures in solidiy. creating db of books. custom book w 2 attributes
                      string title;
                      string author; 
                     }
         constructor() public {                             // contstuctor func only gets ran once. its a life cyclel and its the first func that gets runned when contract is depployed. adding names to the mappings    
             names[1] = "adam";                             //this is how you add the names to the mapping. u reference the name 
             names[2] = "bruce";                            //so looks like ids are created first when contract is deployed
             names[3] = "carl"; 
             }       
         function addBook(uint _id, string memory _title, string memory _author) public { //special func to add a book. args: first is id of name, this is an input function
                  books[_id] = Book(_title, _author);                   //this is how you create a new book. this is how you add a book to the mapping just as we did in the constructor. this is how we add a new book to our database.
                  }                                                     //so this func lets u input data to mapping database. so func is designed to interact w mapping db.
        function addMyBook(uint _id, string memory _title, string memory _author) public {               //this is basically store based on the user whom calls the func.
                 myBooks[msg.sender][_id] = Book(_title, _author);          //msg.sender allows to capture the address of the person calling the func. myBooks init. for nested mapping we use a 2nd bracket [_id]. _title and _author becauise of the struct? msg.sender is theyt key here for the mapping. '[_id]' id for the book that actually getsr returned. 
                }                                                            // so...(reference the skeleton mapping on line 7 for guidance) as a normnal map 'mybBooks' with first key 'msg...' , then the 2nd key for the returinng mapping is the book id (_id/uint(look at skeleton line 7)
               }

//mapping is a key value store data structure
//memory keyword kinda works like RAM where memeory is usedu upon reques while storage holds data between function calls
//memory is a temporary place to store data wehreas storeage holds memory between function calls
//to save gas its best to use 'memory' for intermediate calculations and use 'storage' for final result.
//for nested mapping we will assign books that belong to just you or someone else, individual people
//a nested mapping is a mapping that returns a mapping
//notice how both funcs have the same "=Book(....)"