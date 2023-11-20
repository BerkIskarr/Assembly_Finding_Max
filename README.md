# FindMax Assembly Code

## Description
This assembly code defines a function named `FindMax` that is designed to find the student record with the highest module mark in a collection of student records. The student records are assumed to be stored in memory, and each record consists of 12 bytes, with the module marks located at offset 10 within each record.

## Usage
To use the `FindMax` function, follow these steps:

1. Integrate the assembly code into your project or assembly program.

2. Ensure that the student records are stored in memory, starting at the address `0x10000`. The records should be consecutive, with each record being 12 bytes in size.

3. Call the `FindMax` function.

The function will return the address of the student record with the highest module mark in the `a5` register.

## Function Overview
The `FindMax` function follows the following algorithm:

1. Initialize the memory address (`esi`) to the start of the student records.
2. Load the module mark of the first student record into the `bl` register.
3. Iterate through the student records:
    a. Compare the module mark of the current record with the highest mark found so far (`bl`).
    b. If the current mark is greater, update the highest mark and the address of the highest marked record.
4. Continue the loop until the end address (`0xFFFF`) is reached.
5. Exit the function and return the address of the record with the highest mark.

## Assembly Code Details
- The code uses hexadecimal notation for memory addresses (`0x`) and compares byte values.
- The loop increments the memory address by 12 bytes to move to the next student record.
- The code checks for the end address (`0xFFFF`) to terminate the loop.
- The `je` instruction is used to jump to the exit point when the end address is reached.

## Example
Here is a simple example of how to use the `FindMax` function:

```assembly
section .data
; Define student records here

section .text
global _start

_start:
; Initialize and set up student records in memory

; Call the FindMax function
call FindMax

; The address of the student record with the highest mark is now in a5
; Further processing or output can be done based on the result

; Exit the program
mov eax, 1       ; syscall number for exit
xor ebx, ebx     ; exit code 0
int 0x80         ; call kernel
```
## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
Feel free to customize it further based on your preferences and the specific details of your project.
