pragma solidity =0.6.6;

import '../interfaces/IOwnable.sol';

/**
 * @title Ownable contract
 * @dev The Ownable contract has an owner address, and provides basic authorization control functions.
 */
contract Ownable is IOwnable {
    address public override owner;
    mapping(address => bool) public override minable;

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Modifiers
    modifier onlyMinable() {
        require(minable[msg.sender] == true, 'Unioracle: NOT_MINABLE'); // single check is sufficient
        _;
    }

    modifier validAddress(address _address) {
        require(_address != address(0));
        _;
    }

    // Events
    event OwnershipTransferred(address indexed _previousOwner, address indexed _newOwner);

    /// @dev The Ownable constructor sets the original `owner` of the contract to the sender account.
    constructor(address _owner) public validAddress(_owner) {
        owner = _owner;
    }

    /// @dev Allows the current owner to transfer control of the contract to a newOwner.
    /// @param _newOwner The address to transfer ownership to.
    function transferOwnership(address _newOwner) public override onlyOwner validAddress(_newOwner) {
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }

    /// @dev Allows the current owner to update minable permission of the oracle contract.
    /// @param _address The address of the oracle contract.
    function updateMinable(address _address, bool _minable) public override onlyOwner validAddress(_address) {
        minable[_address] = _minable;
    }
}
