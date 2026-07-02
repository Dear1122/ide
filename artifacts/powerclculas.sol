 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScientificCalculator {

    // Addition
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Subtraction
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Result would be negative");
        return a - b;
    }

    // Multiplication
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // Division
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Cannot divide by zero");
        return a / b;
    }

    // Modulus
    function modulus(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Cannot divide by zero");
        return a % b;
    }

    // Power (base^exponent)
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        uint256 result = 1;

        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }

        return result;
    }

    // Factorial
    function factorial(uint256 n) public pure returns (uint256) {
        require(n <= 20, "Input too large");

        uint256 result = 1;

        for (uint256 i = 2; i <= n; i++) {
            result *= i;
        }

        return result;
    }

    // Integer Square Root (Babylonian Method)
    function sqrt(uint256 x) public pure returns (uint256) {
        if (x == 0) return 0;

        uint256 z = (x + 1) / 2;
        uint256 y = x;

        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }

        return y;
    }

    // Cube
    function cube(uint256 x) public pure returns (uint256) {
        return x * x * x;
    }

    // Integer Cube Root
    function cubeRoot(uint256 x) public pure returns (uint256) {
        uint256 y = 0;

        while ((y + 1) * (y + 1) * (y + 1) <= x) {
            y++;
        }

        return y;
    }

    // Absolute Value
    function absolute(int256 x) public pure returns (uint256) {
        return uint256(x >= 0 ? x : -x);
    }

    // Greatest Common Divisor (GCD)
    function gcd(uint256 a, uint256 b) public pure returns (uint256) {
        while (b != 0) {
            uint256 temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    // Least Common Multiple (LCM)
    function lcm(uint256 a, uint256 b) public pure returns (uint256) {
        require(a != 0 && b != 0, "Inputs must be non-zero");
        return (a / gcd(a, b)) * b;
    }

    // Prime Number Check
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        if (n == 2) return true;
        if (n % 2 == 0) return false;

        for (uint256 i = 3; i * i <= n; i += 2) {
            if (n % i == 0) {
                return false;
            }
        }

        return true;
    }

    // Fibonacci Number
    function fibonacci(uint256 n) public pure returns (uint256) {
        if (n == 0) return 0;
        if (n == 1) return 1;

        uint256 a = 0;
        uint256 b = 1;

        for (uint256 i = 2; i <= n; i++) {
            uint256 c = a + b;
            a = b;
            b = c;
        }

        return b;
    }
}