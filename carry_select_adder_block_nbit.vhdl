-----------------------------------------------------------------------------
-- Title      : carry_select_adder_block_nbit
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- carry_select_adder_block_nbit is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- carry_select_adder_block_nbit is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with carry_select_adder_block_nbit.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : carry_select_adder_block_nbit.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-01-28
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
-- generic parametrized carry select adder sub block
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		generic parametrized carry select adder sub block
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.math_real.ALL;
-- Uncomment the line below if necessary
-- use work.carry_select_adder_package.all;

entity carry_select_adder_block_nbit is 
    generic (
        csa_block_size : positive --:= 64
    );
    port (
        A    : in STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
        B    : in STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
        Cin  : in STD_LOGIC;
        S    : out STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
        Cout : out STD_LOGIC
    );
end carry_select_adder_block_nbit;

architecture structure of carry_select_adder_block_nbit is
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
	--use IEEE.math_real.ALL;

    signal in_fam          : STD_LOGIC_VECTOR (csa_block_size downto 0);
    signal out_fam         : STD_LOGIC_VECTOR (csa_block_size downto 0);

    component ADDnbits is
        generic (
            ADDNbits_size : positive
        );
        port (
            A     : in STD_LOGIC_VECTOR (ADDNbits_size-1 downto 0);
            B     : in STD_LOGIC_VECTOR (ADDNbits_size-1 downto 0);
            S     : out STD_LOGIC_VECTOR (ADDNbits_size-1 downto 0);
            Carry : out STD_LOGIC
        );
    end component ADDnbits;
	
	component FAM_n_bit is 
		generic (
			FAM_size : positive
		);
		Port (
			input    : in  STD_LOGIC_VECTOR (FAM_size-1 downto 0);
			cin      : in  STD_LOGIC;
			carry_in : in  STD_LOGIC;
			output   : out STD_LOGIC_VECTOR (FAM_size-1 downto 0);
			cout: out STD_LOGIC
		);
	end component FAM_n_bit;


begin
    ADDNbits_port     : ADDnbits generic map (ADDNbits_size => csa_block_size) port map(A(csa_block_size-1 downto 0), B(csa_block_size-1 downto 0), in_fam(csa_block_size-1 downto 0), in_fam(csa_block_size));
    FAM_n_bit_port    : FAM_n_bit generic map (FAM_size => csa_block_size) port map(in_fam(csa_block_size-1 downto 0), Cin, in_fam(csa_block_size), out_fam(csa_block_size-1 downto 0), out_fam(csa_block_size));

    S    <= out_fam(csa_block_size-1 downto 0);
    Cout <= out_fam(csa_block_size);

end structure;
