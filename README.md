The LFSR will cycle through all 7 non-zero 3-bit values before repeating.

Initial value is set to 3'b001 to avoid lock-up in an all-zero state (which is a known LFSR pitfall).

The feedback taps Q[2] and Q[0] are chosen based on a maximum-length polynomial for 3-bit LFSR: x³ + x + 1.

![image](https://github.com/user-attachments/assets/0ba897b1-8fbe-4900-8d8a-99b70caede96)
