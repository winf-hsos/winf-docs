# 5 - Code Systems

> Bytes are dumb. They just contain patterns of ons and offs. If a byte contains 0100 0101, and you send it to the printer, it will print the letter ‘E.’ If you send it to the Instruction Register, the computer will execute a Jump instruction. If you send it to the Memory Address Register, it will select byte number 69 of the RAM. If you send it to one side of the Adder, it will add 69 to whatever is on the other side of the Adder. If you send it to the display screen, it will set three pixels on and five pixels off.
>
> (Scott, J Clark. But How Do It Know? - The Basic Principles of Computers for Everyone)

## Key Points

* Computers internally only work with zeroes and ones. This appears to pose a problem to anyone who, for example, wants to use a computer to process text with letters and other symbols. How can a computer represent letters, when all it can store and process are 0 and 1?
* The answer lies in the permutations we can obtain with a given number of 0 and 1. Say we have 8 bits (that is, 8 switches that can either be on or off). With those 8 bits, we can create $$2^7 = 256$$ different permutations of zeroes and ones. If we now assign a symbol to each of those permutations, we arrive at what we call a _code system_. A symbol can be anything we like. When we look at text processing, a symbol might be A, B, C, 1, 2, 3 and so forth. But it can also be a color or a sound, or a command to the printer.
* We can calculate the number of permutations we need for our code system if we know the structure of a message we want to transmit or store.

## Morse Code

## The RGB-Code

## Material

| Title                                                                                                                                                                      | Type         | PDF                                                                                                      |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | -------------------------------------------------------------------------------------------------------- |
| [Wirtschaftsinformatik #02 - Codes](https://docs.google.com/presentation/d/1XcdMGmzX-D5byd140JNXZ56twkQgLRto5Wr7IvM3bBY/preview)                                           | Slides       | [🔗](https://docs.google.com/presentation/d/1XcdMGmzX-D5byd140JNXZ56twkQgLRto5Wr7IvM3bBY/export/pdf)     |
| [Measuring Information](https://www.khanacademy.org/computing/computer-science/informationtheory/moderninfotheory/v/how-do-we-measure-information-language-of-coins-10-12) | YouTube      | -                                                                                                        |
| [Chapter 2 - Codes and Combinations from \[1\]](http://osca.hs-osnabrueck.de/)                                                                                             | Book Chapter | -                                                                                                        |
| [Chapter 9 - Bit by Bit by Bit from \[1\]](http://osca.hs-osnabrueck.de/)                                                                                                  | Book Chapter | -                                                                                                        |
| [Exercise - Information & Codes](https://docs.google.com/document/d/1yuHOp94Ce\_CTP6e5mCwLxKfgIctlUZgN44r6ZES8JC0/preview)                                                 | Exercise     | [🔗](https://docs.google.com/document/d/1yuHOp94Ce\_CTP6e5mCwLxKfgIctlUZgN44r6ZES8JC0/export?format=pdf) |

## References

\[1]  Petzold, Charles. _Code: The Hidden Language of Computer Hardware and Software_. Paperback ed, Microsoft Press, 2000.

\[2]  Scott, J. Clark. _But How Do It Know?: The Basic Principles of Computers for Everyone_. John C. Scott, 2009.
