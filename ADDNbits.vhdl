-----------------------------------------------------------------------------
-- Title      : ADDNbits
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- ADDNbits is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- ADDNbits is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with ADDNbits.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : ADDNbits.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-01-10
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
-- generic parametrized carry ripple adder nbit unit
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		generic parametrized carry ripple adder nbit unit
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--library work;
--use work.carry_select_adder_package.all;

entity ADDNbits is generic(ADDNbits_size : positive);
Port ( A, B : in STD_LOGIC_VECTOR (ADDNbits_size-1 downto 0);
       S : out STD_LOGIC_VECTOR (ADDNbits_size-1 downto 0);
       Carry : out STD_LOGIC
);
end entity ADDNbits;

architecture structure of ADDNbits is

component ADD1bit is
port( A : in STD_LOGIC;
      B : in STD_LOGIC;
      Cin : in STD_LOGIC;
      S : out STD_LOGIC;
      Cout : out STD_LOGIC
);
end component ADD1bit;

signal C : STD_LOGIC_VECTOR (ADDNbits_size downto 0);

begin

C(0) <= '0';

FA : for i in 0 to ADDNbits_size-1 generate
begin
      FA_i : ADD1bit port map(A(i), B(i), C(i), S(i), C(i+1));
end generate;

Carry <= C(ADDNbits_size);
end structure;
