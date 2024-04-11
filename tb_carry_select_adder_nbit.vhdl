-----------------------------------------------------------------------------
-- Title      : tb_carry_select_adder_nbit
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- tb_carry_select_adder_nbit is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- tb_carry_select_adder_nbit is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with tb_carry_select_adder_nbit.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : tb_carry_select_adder_nbit.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-02-03
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
--  Test bench to test carry_select_adder_nbit.vhdl
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		Test bench to test carry_select_adder_nbit.vhdl
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--library work;
--use work.carry_select_adder_package.all;

ENTITY tb_carry_select_adder_nbit IS
END tb_carry_select_adder_nbit;

ARCHITECTURE behavior OF tb_carry_select_adder_nbit IS

constant csa_size : positive := 64;

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT carry_select_adder_nbit is generic(
	csa_size : positive := csa_size
);
PORT(
A : in std_logic_vector(csa_size-1 downto 0);
B : in std_logic_vector(csa_size-1 downto 0);
--Cin : in std_logic;
S : out std_logic_vector(csa_size-1 downto 0);
Cout : out std_logic
);

END COMPONENT;


--Inputs

signal A : std_logic_vector(csa_size-1 downto 0) := (others => '0');
signal B : std_logic_vector(csa_size-1 downto 0) := (others => '0');
--signal Cin : std_logic := '0';

--Outputs

signal S : std_logic_vector(csa_size-1 downto 0);
signal Cout : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)

uut: carry_select_adder_nbit PORT MAP (
A => A,
B => B,
--Cin => Cin, 
S => S,
Cout => Cout
);

-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.

--wait for 4 ns;

A <= x"160761ADC6FFEED0";
B <= x"EF12990C0192DAB5";
--Cin <= '0';
wait for 10 ns;

A <= x"0EF01523BCDEF0CC";
B <= x"CCDE1598224CECDE";
--Cin <= '1';
wait for 10 ns;

A <= x"160761ADC6FFEED0";
B <= x"A0A324509C1426C2";
--Cin <= '1';
wait for 10 ns;

wait;
end process;
END;
