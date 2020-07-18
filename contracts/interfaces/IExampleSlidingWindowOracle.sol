pragma solidity >=0.5.0;

interface IExampleSlidingWindowOracle {
    event OracleUpdate(
        address indexed sender,
        address indexed tokenA,
        address indexed tokenB,
        uint price0Cumulative,
        uint price1Cumulative,
        address pair
    );
    function update(address tokenA, address tokenB, address to) external;
    function consult(address tokenIn, uint amountIn, address tokenOut) external view returns (uint amountOut);
}
