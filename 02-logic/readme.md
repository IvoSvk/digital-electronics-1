# Lab 2: Ivan Lipták

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![K-maps](https://github.com/IvoSvk/digital-electronics-1/blob/ef4ba808c797e59d272ec2aff71e4ba3462700de/images/BgA.png)

   Less than:

   ![K-maps](https://github.com/IvoSvk/digital-electronics-1/blob/c193bd8ebdbf77f58d3dd3d389120dd2a65e6b78/images/BlA.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](https://github.com/IvoSvk/digital-electronics-1/blob/6b739176c1fc21906f23ad90d77cd09ccdc70c18/images/K-mapequations.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx42**

```vhdl
     p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";


 -- first test case (My id number) ...
        s_b <= "0100"; s_a <= "0010"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=0100, a=0010 FAILED" severity error;

 -- second test case ...
        s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=0000, a=0001 FAILED" severity error;
        

        
        -- third test case ...
        s_b <= "1100"; s_a <= "1111"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=1100, a=1111 FAILED" severity error;
        
                -- 4th test case ...
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=0000, a=0000 FAILED" severity error;
       
        
         -- 5th test case ...
        s_b <= "0100"; s_a <= "0100"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=0100, a=0100 FAILED" severity error;
        
 -- 6th test case ...
        s_b <= "0010"; s_a <= "0100"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination b=0010, a=0100 FAILED" severity error;
        


        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;


```

2. Link to your public EDA Playground example:

   [4-bit binary comparator](https://www.edaplayground.com/x/JYzr)


