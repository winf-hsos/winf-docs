# Code Systems

## **The Beginnings**

### **Baudot Codes**

**Baudot code is a 5-bit binary code that was used with teletypewriters, a device similar to a typewriter but with only 30 keys and a spacebar.** The keys on a teletypewriter are switches that generate a binary code, sending it one bit at a time down the output cable to be printed on paper. **Emile Baudot, an officer in the French Telegraph Service, invented the code in connection with a printing telegraph in the 1870s.** **Western Union used Baudot code into the 1960s for sending and receiving text messages known as telegrams.** Computer enthusiasts may still refer to the transmission speeds of binary data as _baud rates_ as a nod to the code's impact on digital communication.

**A 5-bit code means there are only 32 possible codes, represented in hexadecimal from 00h to 1Fh.** Twenty-six of those codes are assigned to letters of the alphabet. The remaining five are:

* **Space (04h)**: Used to separate words
* **Carriage Return (02h) and Line Feed (08h)**: These codes, named for typewriter functions, instruct the teletypewriter printer to move the carriage to the right, so the next line starts at the left margin (carriage return) and then roll the carriage down to start a new line (line feed).
* **Figure Shift (1Bh)**: This code acts as a shift code, instructing the teletypewriter to interpret subsequent codes as numbers or punctuation marks.
* **Letter Shift (1Fh)**: This code ends the Figure Shift, instructing the teletypewriter to revert to interpreting codes as letters.

**Similar to Morse code, Baudot code does not differentiate between uppercase and lowercase letters.**
