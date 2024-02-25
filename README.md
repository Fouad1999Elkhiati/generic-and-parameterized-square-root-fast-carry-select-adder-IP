# generic and parametrized square root fast carry select adder IP
This is a github repository of a generic and parametrized nbit square-root-carry-select-adder IP (Intellectual Property) designed in VHDL and simulated in Modelsim and synthetized and implemented in Xilinx ISE 14.7 VM.

# Context :
Introduction: This project is an initial project that falls within a larger project, the aim of which is to delve into the world of digital electronic systems engineering (FPGA) with high efficiency and speed directed at processing digital signals through understanding the working principle of the most important types of primary electronic circuits and previous research in this field, and then working to implement the best designs that It has proven its efficiency in terms of speed, power consumption and space in integrated reconfigurable circuits (FPGA (field programming gate array)) in processing digital signals by implementing well-known mathematical processing algorithms in this academic field, and then there is an attempt to implement improved designs to further improve its performance.

# State of art :
Accordingly, digital signal processing algorithms are based in their entirety on many arithmetic operations, the most important of which are multiplication and addition. Addition operations are the simplest and first. Through this initial introduction, the first project I chose to work on was choosing the most important type of digital Adder that balances between high speed and low power consumption and low surface area in integrated chip, it is (Carry Select Adder) here is a detailed explanation of the working principle of this digital adder and difference between fixed/ variable (square root topology) carry select block size in term of worst case propagation delay T(n) with n (number of bits for inputs A and B):

https://slideplayer.com/slide/9123351/

https://slideplayer.com/slide/4896714/ (begining from slide 89)

Then I looked at the latest research conducted on this type of adders the first modified approach I found reduced space and energy consumption with speed improvements in observed in some research was implemented by replacing one of the two RCAs (ripple carry adders) in the conventional carry select adder block with binary to excess converter (BEC) to calculate 
(A(k),A(k-1) ... A(k-m+1) + B(k),B(k-1) ... B(k-m+1) + 1) value instead of using another RCA with carry = 1.

basic conventional block : 

![image](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/daba019c-01a6-43a3-8ca6-9f9d589a739c)

BEC based carry select adder block : 

![image](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/63d93f0c-b96f-40dc-ae10-f6ac8389055f)
with BEC structure is : 
![image](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/1f1ce7dc-ce13-4efe-8e8b-ecbb614ccb29)



see : https://www.researchgate.net/publication/334442229_Design_and_characterization_of_high_speed_carry_select_adder

https://www.ijera.com/papers/Vol2_issue5/CQ25550554.pdf

The second modified version of carry select adder i found is an approach done with replacing both BEC unit and MUX 2n to n (multiplexer) with Fast Add-one and Multiplexing unit (FAM)
so the new improved carry select adder block will look like this : 
![1-s2 0-S0167926021000353-gr5](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/fba82273-adb7-4503-b54a-170099fdb18e)
in the paper below you will find more dztails about the study : https://www.sciencedirect.com/science/article/abs/pii/S0167926021000353
the FAM based carry select adder show the fastest performance among all the designs.

the new [FAM based carry select adder] is faster than the previous versions and more area and power effecient.

The overal FAM based carry select adder square root topology will look like this : 
![image](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/1766531e-3860-4023-94f0-c6201f97e844)

In this paper : https://www.sciencedirect.com/science/article/abs/pii/S0167926021000353 you will find the details about the study that shows that the FAM based carry select adder is the fastest ever in term of speed and delay.

# Comparative study :
Now we going to compare the performance of the design FAM based carry select adder with some designs tested and synthesized in the paper : https://sci-hub.se/https://ieeexplore.ieee.org/document/8116819

this paper compare between : Conventional CSA, CBL CSA, BEC CSA, HSCG CSA, and Proposed design (proposed by the researchers : G. Kishore Kumar and N. Balaji) the designs are synthesized using Xilinx ISE 14.7 and implemented in the board Xilinx Virtex-5
xc5vsx50tffg1136-1c FPGA and we will test our design in the same board.
![Capture d'écran 2024-02-24 201235](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/bf827633-5f6a-46cc-b5bc-ec10d85c5018)

![Capture d'écran 2024-02-24 201320](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/b6ee6b6d-0e87-4e79-ae1c-4e84a9504050)

![Capture d'écran 2024-02-24 201339](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/d3b4be5b-cd53-4837-909e-2a207f773d60)

![Capture d'écran 2024-02-24 201358](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/c738b0ed-581f-4289-ba4b-95ac27e4ea07)

The results of delay and area after testing FAM Based CSA are : 

![image](https://github.com/Fouad1999Elkhiati/generic-square-root-carry-select-adder-IP/assets/160315289/5cb65ce7-08e1-44b1-9d43-5dfc4c78998a)
Note that in the folder compare.zip you can find screen shots of generated reports, i run the simulation successfully but i found a problem generating .vcd file to complete Power consumption study using XPower tool.
