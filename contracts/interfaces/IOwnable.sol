pragma solidity >=0.5.0;

interface IOwnable {
    function owner() external view returns (address);
    function minable(address _address) external view returns (bool);
    function transferOwnership(address _newOwner) external;
    function updateMinable(address _address, bool _minable) external;
}
