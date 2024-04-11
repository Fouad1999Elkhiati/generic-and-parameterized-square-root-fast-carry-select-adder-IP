-----------------------------------------------------------------------------
-- Title      : FAM_n_bit
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- FAM_n_bit is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- FAM_n_bit is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with FAM_n_bit.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : FAM_n_bit.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-01-10
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
-- Fast Add-one and Multiplexing nbit unit
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		Fast Add-one and Multiplexing nbit unit
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FAM_n_bit is generic (FAM_size : positive);
Port (
    input    : in  STD_LOGIC_VECTOR (FAM_size-1 downto 0);
    cin      : in  STD_LOGIC;
    carry_in : in  STD_LOGIC;
    output   : out STD_LOGIC_VECTOR (FAM_size-1 downto 0);
    cout: out STD_LOGIC
);
end FAM_n_bit;

architecture Behavioral of FAM_n_bit is
  signal c : STD_LOGIC_VECTOR (FAM_size-1 downto 0) := (others => '0');
begin
  output(0) <= input(0) xor cin;
  c(0) <= input(0);
  
  FAM :	for i in 1 to FAM_size-1 generate
  begin
		output(i) <= (c(i-1) and cin) xor input(i);
		c(i) <= c(i-1) and input(i);
  end generate;
  cout <= (c(FAM_size-1) and cin) or carry_in;
end Behavioral;
