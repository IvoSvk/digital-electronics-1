library ieee;
use ieee.math_real.uniform;
use ieee.math_real.floor;
use ieee.numeric_std.all;

use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_a           : std_logic_vector(3 - 1 downto 0);
    signal s_b           : std_logic_vector(3 - 1 downto 0);
    signal s_c           : std_logic_vector(3 - 1 downto 0);
    signal s_d           : std_logic_vector(3 - 1 downto 0);
    
    signal s_si          : std_logic_vector(3 - 1 downto 0);
    
    signal s_f_out       : std_logic_vector(3 - 1 downto 0);
    
begin
    -- Connecting testbench signals with comparator_3bit entity (Unit Under Test)
    uut_comparator_3bit : entity work.mux_3bit_4to1
        port map(
            a_i     => s_a,
            b_i     => s_b,
            c_i     => s_c,
            d_i     => s_d,      
            
            s_i     => s_si,
            f_o     => s_f_out
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started. ---------------------------------------" severity note;
        s_a     <= "011";
        s_b     <= "010";
        s_c     <= "001";
        s_d     <= "000";
        
        s_si    <= "000";
        wait for 100 ns;
        assert (s_f_out = s_a)
        report "Test failed for input combination: 00" severity error;        
    	wait for 100 ns;

        s_si    <= "001";
        wait for 100 ns;
        assert (s_f_out = s_b)
        report "Test failed for input combination: 01" severity error;        
    	wait for 100 ns;

        s_si    <= "010";
        wait for 100 ns;
        assert (s_f_out = s_c)
        report "Test failed for input combination: 10" severity error;        
    	wait for 100 ns;

        s_si    <= "011";
        wait for 100 ns;
        assert (s_f_out = s_d)
        report "Test failed for input combination: 11" severity error;        
    	wait for 100 ns;
    	
    	-- test for another inputs
    	
    	s_a     <= "001";
        s_b     <= "011";
        s_c     <= "000";
        s_d     <= "010";
        
        s_si    <= "000";
        wait for 100 ns;
        assert (s_f_out = s_a)
        report "Test failed for input combination: 00" severity error;        
    	wait for 100 ns;

        s_si    <= "001";
        wait for 100 ns;
        assert (s_f_out = s_b)
        report "Test failed for input combination: 01" severity error;        
    	wait for 100 ns;

        s_si    <= "010";
        wait for 100 ns;
        assert (s_f_out = s_c)
        report "Test failed for input combination: 10" severity error;        
    	wait for 100 ns;

        s_si    <= "011";
        wait for 100 ns;
        assert (s_f_out = s_d)
        report "Test failed for input combination: 11" severity error;        
    	wait for 100 ns;
    	
        -- Report a note at the end of stimulus process
        report "Stimulus process finished. ---------------------------------------" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;