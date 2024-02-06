// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // we van write it as >=0.8.7 < 0.9.1;

contract SimpleStorage {
    uint256 public favouriteNumber; // so this is kind of function which can be used to see the value of favouriteNumber

    // there are 4 types of scopes public,private, internal and external
    // public and private u know internal is just like orivate and external meansn only outside function can use them not parent

    // the gas is only used up when we modify our chain so viewing and functions which doesn't need storage has no gas charges
    // these functions are called views and pure fucntions

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    //example of view and pure
    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }

    // 0xd9145CCE52D386f254917e481eB44e9943F39138  <- this is fake account we used to deploy our project

    // Struct insolidity
    struct People {
        uint256 favNumber;
        string name;
    }
    People public person = People({favNumber: 2, name: "pattrick"});

    // arrays in solidity
    uint256[] public favNumberlist;
    People[] public people; //dynamic array i.e. size is not defined
    People[3] public fixpeople; // fixed size array

    //mapping is just like hashmap
    mapping(string => uint256) public nameToNumber; // so this map is used string as a key to amp number

    function addpeople(uint256 _num, string memory _nam) public {
        people.push(People({favNumber: _num, name: _nam}));
        nameToNumber[_nam] = _num; // mapping part
        //or
        People memory n1 = People({favNumber: _num, name: _nam});
        people.push(n1);
    }

    // memory chronology
    // -> memory : it is muttable data which is locally stored for a sake of fucntion and had no significance outside function
    // -> calldata :  so it is immmutable data that this local to the fucntion and is not stored in the memeory
    // -> storage : it is used to store the data in the permanent memory

    // so we need to write this in front of string as string can be of any size and not lile any other data type like int256
}
