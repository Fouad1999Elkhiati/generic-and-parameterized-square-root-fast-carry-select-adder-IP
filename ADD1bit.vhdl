-----------------------------------------------------------------------------
-- Title      : ADD1bit
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- ADD1bit is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- ADD1bit is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with ADD1bit.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : ADD1bit.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-01-10
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
-- The file describe carry skip 1bit Adder implementation
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		carry skip 1bit Adder implementation
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADD1bit is
Port ( A, B, Cin : in STD_LOGIC;
        S, Cout : out STD_LOGIC
);
end ADD1bit;

architecture archi of ADD1bit is

begin
    S <= A xor B xor Cin;
	Cout <= ((A xor B) and Cin) or (A and B);
end archi;
