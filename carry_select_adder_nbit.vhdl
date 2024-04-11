-----------------------------------------------------------------------------
-- Title      : carry_select_adder_nbit
-- Copyright © 2024 Fouad EL khiati
-----------------------------------------------------------------------------
-- This file is part of FPGA FAM based CSA.

-- carry_select_adder_nbit is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- carry_select_adder_nbit is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with carry_select_adder_nbit.  If not, see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------------
-- File       : carry_select_adder_nbit.vhdl
-- Author     : Fouad EL khiati
-- Last update: 2024-02-03
-- Platform   : FPGA (tested on Virtex 5)
-----------------------------------------------------------------------------
-- Description: 
-- generic parametrized design of nbit carry select adder
-----------------------------------------------------------------------------
-- Revisions  :
-- Date			Version		Author		Description
-- 2024  		1.0      	Fouad		generic parametrized design of nbit carry select adder
-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.math_real.ALL;

package carry_select_adder_package is
    function calculate_max_sqrt_size(n : in natural) return natural;
	function calculate_full_adder_size(n : in natural) return natural;
	function calculate_internal_signal_size(n : in natural; m : in natural) return natural;
	function calculate_max(n : in natural; m : in natural) return natural;
	function calculate_indx_1(n : in natural) return natural;
	function calculate_indx_2(n : in natural) return natural;
	function calculate_indx_3(n : in natural) return natural;
	function calculate_indx_4(n : in natural) return natural;
	function calculate_indx_5(n : in natural) return natural;
	function calculate_indx_6(n : in natural) return integer;
	function calculate_indx_7(n : in natural) return integer;
	function calculate_indx_8(n : in natural) return natural;
	function calculate_indx_9(n : in natural) return natural;
	function calculate_indx_10(n : in natural) return natural;
	function calculate_indx_11(n : in natural) return natural;
	function calculate_indx_12(n : in natural) return natural;
	function calculate_indx_13(n : in natural) return natural;
	function calculate_indx_14(n : in natural) return integer;
	function calculate_indx_15(n : in natural) return natural;
	function calculate_indx_16(n : in natural) return natural;
	function calculate_end_size(n : in natural; m : in natural) return natural;
	function calculate_inter_sign_1(n : in natural) return natural;
	function calculate_inter_sign_2(n : in natural) return natural;
	
end package;

package body carry_select_adder_package is

    function calculate_max_sqrt_size(n : in natural) return natural is
        variable temp : real;
    begin
        temp := (8.0 * real(n) + 1.0) ** 0.5 - 1.0;
        return natural(floor(real(temp / 2.0)));
    end calculate_max_sqrt_size;
	
	function calculate_full_adder_size(n : in natural) return natural is
    begin
		if n = 1 then
			return 2;
		else 
			return 1;
		end if;
    end calculate_full_adder_size;
	
	function calculate_internal_signal_size(n : in natural; m : in natural) return natural is
    begin
		if n > 0 then
			return m + 2;
		else
			return m + 1;
		end if;
    end calculate_internal_signal_size;
	
	function calculate_max(n : in natural; m : in natural) return natural is
    begin
		if n > m then
			return n;
		else
			return m;
		end if;
    end calculate_max;
	
	function calculate_indx_1(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 1;
		else 
			return 0;
		end if;
    end calculate_indx_1;
	
	function calculate_indx_2(n : in natural) return natural is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_2;
	
	function calculate_indx_3(n : in natural) return natural is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_3;
	
	function calculate_indx_4(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 0;
		else 
			return 0;
		end if;
    end calculate_indx_4;
	
	function calculate_indx_5(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 1;
		else 
			return 0;
		end if;
    end calculate_indx_5;
	
	function calculate_indx_6(n : in natural) return integer is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return -1;
		else 
			return 0;
		end if;
    end calculate_indx_6;
	
	function calculate_indx_7(n : in natural) return integer is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_7;
	
	function calculate_indx_8(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 0;
		else 
			return 0;
		end if;
    end calculate_indx_8;
	
	function calculate_indx_9(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 1;
		else 
			return 0;
		end if;
    end calculate_indx_9;
	
	function calculate_indx_10(n : in natural) return natural is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_10;
	
	function calculate_indx_11(n : in natural) return natural is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_11;
	
	function calculate_indx_12(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_12;
	
	-------
	
	function calculate_indx_13(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 1;
		else 
			return 0;
		end if;
    end calculate_indx_13;
	
	function calculate_indx_14(n : in natural) return integer is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return -1;
		else 
			return 0;
		end if;
    end calculate_indx_14;
	
	function calculate_indx_15(n : in natural) return natural is
    begin
		if n = 0 then
			return 1;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_15;
	
	function calculate_indx_16(n : in natural) return natural is
    begin
		if n = 0 then
			return 0;
		elsif n = 1 then
			return 0;
		else 
			return 1;
		end if;
    end calculate_indx_16;
	
	function calculate_end_size(n : in natural; m : in natural) return natural is
	begin
		if n = 0 then
			return m - 1;
		else
			return m - 2;
		end if;
	end calculate_end_size;
	
	function calculate_inter_sign_1(n : in natural) return natural is
	begin
		if n = 2 then
			return 0;
		else 
			return 1;
		end if;
	end calculate_inter_sign_1;
	
	function calculate_inter_sign_2(n : in natural) return natural is
	begin
		if n > 1 then
			return 1;
		else 
			return 0;
		end if;
	end calculate_inter_sign_2;
	
end package body;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.math_real.ALL;
use work.carry_select_adder_package.all;

entity carry_select_adder_nbit is
    generic (
        csa_size : positive
    );
    port (
        A    : in STD_LOGIC_VECTOR (csa_size-1 downto 0);
        B    : in STD_LOGIC_VECTOR (csa_size-1 downto 0);
        S    : out STD_LOGIC_VECTOR (csa_size-1 downto 0);
        Cout : out STD_LOGIC
    );
end carry_select_adder_nbit;

architecture structure of carry_select_adder_nbit is

    constant max_sqrt_size : natural := calculate_max_sqrt_size(csa_size);
	constant middle_size : natural := (csa_size - ((max_sqrt_size * (max_sqrt_size + 1)) / 2));
    constant internal_sign_size : natural := calculate_internal_signal_size(middle_size,max_sqrt_size);
    signal internal : STD_LOGIC_VECTOR (internal_sign_size-1 downto 0); -- := (others => '0');

	constant full_adder_size : natural := calculate_full_adder_size(middle_size);
	constant end_size : natural := calculate_end_size(middle_size,internal_sign_size);
	
	constant indx_1 : natural := calculate_indx_1(middle_size);
	constant indx_2 : natural := calculate_indx_2(middle_size);
	constant indx_3 : natural := calculate_indx_3(middle_size);
	constant indx_4 : natural := calculate_indx_4(middle_size);
	constant indx_5 : natural := calculate_indx_5(middle_size);
	constant indx_6 : integer := calculate_indx_6(middle_size);
	constant indx_7 : integer := calculate_indx_7(middle_size);
	constant indx_8 : natural := calculate_indx_8(middle_size);
	constant indx_9 : natural := calculate_indx_9(middle_size);
	constant indx_10 : natural := calculate_indx_10(middle_size);
	constant indx_11 : natural := calculate_indx_11(middle_size);
	constant indx_12 : natural := calculate_indx_12(middle_size);
	constant indx_13 : natural := calculate_indx_13(middle_size);
	constant indx_14 : integer := calculate_indx_14(middle_size);
	constant indx_15 : natural := calculate_indx_15(middle_size);
	constant indx_16 : natural := calculate_indx_16(middle_size);
	
	constant inter_sign_1 : natural := calculate_inter_sign_1(full_adder_size);
	constant inter_sign_2 : natural := calculate_inter_sign_2(middle_size);
	
	constant max : natural := calculate_max(2,middle_size);
	component ADD1bit is
		port( 
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC
		);
	end component ADD1bit;

    component carry_select_adder_block_nbit is
        generic (
            csa_block_size : positive
        );
        port (
            A    : in STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
            B    : in STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
            Cin  : in STD_LOGIC;
            S    : out STD_LOGIC_VECTOR (csa_block_size-1 downto 0);
            Cout : out STD_LOGIC
        );
    end component carry_select_adder_block_nbit;

begin

	internal(0) <= '0';	
	FA : for i in 0 to full_adder_size-1 generate
	begin
		FA_i : ADD1bit port map(A(i), B(i), internal(i), S(i), internal(i+1));
	end generate;

    csa_instanciating: for i in 2 to middle_size generate
    begin
        carry_select_adder_block_nbit_i: carry_select_adder_block_nbit
            generic map (csa_block_size => i)
            port map (
                A => A((indx_1*(i*(i + 1))/2 + indx_2*(i-1) + indx_3*(i*(i - 1))/2 + indx_4*middle_size) downto ((indx_5*(i*(i + 1))/2 + indx_6*(i-1) + indx_7*(i*(i - 1))/2 + indx_8*middle_size))),
                B => B((indx_1*(i*(i + 1))/2 + indx_2*(i-1) + indx_3*(i*(i - 1))/2 + indx_4*middle_size) downto ((indx_5*(i*(i + 1))/2 + indx_6*(i-1) + indx_7*(i*(i - 1))/2 + indx_8*middle_size))),
                Cin => internal(i-inter_sign_1),
                S => S((indx_1*(i*(i + 1))/2 + indx_2*(i-1) + indx_3*(i*(i - 1))/2 + indx_4*middle_size) downto ((indx_5*(i*(i + 1))/2 + indx_6*(i-1) + indx_7*(i*(i - 1))/2 + indx_8*middle_size))),  
                Cout => internal(i-inter_sign_1+1)  
            );
    end generate;

    csa_instanciating_2: for i in max to end_size generate
    begin
        carry_select_adder_block_nbit_j: carry_select_adder_block_nbit
            generic map (csa_block_size => i)
            port map (
                A => A((indx_9*(i*(i + 1))/2 + indx_10*(i-1) + indx_11*(i*(i - 1))/2 + indx_12*middle_size) downto ((indx_13*(i*(i + 1))/2 + indx_14*(i-1) + indx_15*(i*(i - 1))/2 + indx_16*middle_size))),
                B => B((indx_9*(i*(i + 1))/2 + indx_10*(i-1) + indx_11*(i*(i - 1))/2 + indx_12*middle_size) downto ((indx_13*(i*(i + 1))/2 + indx_14*(i-1) + indx_15*(i*(i - 1))/2 + indx_16*middle_size))),
                Cin => internal(i-inter_sign_1+inter_sign_2),
                S => S((indx_9*(i*(i + 1))/2 + indx_10*(i-1) + indx_11*(i*(i - 1))/2 + indx_12*middle_size) downto ((indx_13*(i*(i + 1))/2 + indx_14*(i-1) + indx_15*(i*(i - 1))/2 + indx_16*middle_size))),  
                Cout => internal(i-inter_sign_1+inter_sign_2+1)  
            );
    end generate;

    Cout <= internal(internal_sign_size-1);

end structure;
