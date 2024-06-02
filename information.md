# Information

Imagine we are playing a number guessing game. I am thinking of a number between 1 and 16, and your goal is to guess it. The catch is that you can only ask for a specific number once, but you can narrow down the possibilities with questions in the form of "Is it greater than X". For each question, I will tell you "yes" or "no", effectively narrowing down the options you are left with. With each answer you get, your uncertainty about my number decreases because you can rule out some of the possible numbers. This process of systematically narrowing down the possibilities is at the heart of information theory. By reducing uncertainty, you gather more information with each guess. But how much information do you get with each answer? And how can we measure this?

## Definition and Measurement of Information

In computer science, information can be defined as _"that which allows you to make a correct prediction with accuracy better than chance" <mark style="background-color:orange;">\[CITE]</mark>_. In information theory, this simply means reducing uncertainty. Or, in other words: reducing the number possible options.&#x20;

With that in mind, let’s revisit our number guessing game. Each answer you receive narrows down the range of possible numbers. This reduction of uncertainty can be measured, and the unit we use is called a bit. A bit, short for binary digit, is the **basic unit of information** and represents a reduction of uncertainty - or the number of options left - by half.

But if a bit of information is equal to eliminating half the possible numbers, then not all questions give you one bit of information. If your first question is "Is your number greater than 12?", and I say "no", then you are left with the numbers 1 thorugh 12, which leaves you with 12 options and is more than half of the original 16 numbers. To receive one bit of information, your first question should be: "Is your number greater than 8?". When the answer is "yes", you are left with 8 options: 9 through 16. When the answer is "no", you are also left with 8 options: 1 through 8. In any case, half of the options from before are removed. You reduced your uncertainty by one bit.

Assume the answer to your first question was "No". I am sure you can figure out the next question that maximizes the reduction in uncertainty - or information. You're right, it's: "Is it greater than 4". No matter the answer, you will always be left with 4 possible numbers: 5 through 8 when the answer is "Yes", and 1 through 4 when it's "No". Again, we gained one bit of information.

We can go on and ask questions in this manner. Finally, we will be left with only one option, which reduces the uncertainity to zero. There are no options left to choose from.

## Uncertainty

We just learned that with each yes/no question that removes half of the possibilites, we gain one bit of information. If $$H_0$$ is the uncertainty before we receive the answer to our question, and $$H_1$$ is the uncertainty after we considered the answer, then the  information $$I$$ we gained with this answer is the difference between both uncertainties:

$$
I = H_0 - H_1
$$

Information is thus the amount of reduced uncertainty. But if we need to subtract two uncertainties to calclate the information content, how can we measure uncertainty?

A simple and naive approach no measure uncertainty would to use the inverse probabilty of a correct guess given the current possibilities left. What does that mean? Let's consider our number guessing game to clarify this. At the beginning of the game, there are 16 possible numbers I could be thinking of. I you made a random guess, what is your chance of guessing the correct number?

$$
P(correct) = \frac{1}{16}
$$

Guessing with no hints gives you a 0,0625 probability of being right. Not too high of a chance. So maybe you should ask the first question to eliminate half of the possibilities. This increases your probability:

$$
P(correct) = \frac{2}{16}  = \frac{1}{8}
$$

That's better. With every subsequent questions, your chance doubles and your uncertainty halves. But if we wanted to use the probability of a correct guess as our measure for uncertainty, that measure must decrease and not increase with new information. To achieve this, we could simply invert the probabilty. Assuming this, our uncertainty from the outset would be 16. After the first question, it would be 8, then 4, 2, and finally 1.

Can you spot the problem? Even if we know the answer for sure, because only one option is left, the uncertainty would still be 1. That doesn't sound right. Claude Shannon, the father of information theory, proposed to measure uncertainty as the base-2 logarithm of the number of possibilities:&#x20;

$$
H = log_2(N)
$$

This has a number of desireable properties. Firstly, when $$N = 1$$, then the uncertainty becomes zero, as one would anticipate:

$$
log_2(1) = 0
$$

Furthermore, calculating with uncertainties is simplified when using logarithms. Logarithms turn products into sums when we have two independent events about which we are uncertain of their outcome. Imagine I change the game and I now come up with two numbers between 1 and 16 and  I choose both independent from each other. If you haven't asked any question yet, your uncertainty for each number is 4 bits, because:

$$
log_2(16) = 4
$$

We can say that the that the total uncertainty regarding both number is 8, because we can simply add the two logarithms:

$$
log_2(16) + log_2(16) = 4+4 = 8
$$

With probabilites, we would have to multiply the values to calculate the probability of you guessing both numbers correctly:

$$
P(correct, correct) = \frac{1}{16}\times\frac{1}{16}= \frac{1}{256}
$$

So basically, we multiplied the number of possibilities for both numbers, which is 256. We can see that using the base-2 logarithm is equivalent, because:

$$
log_2(256) = 8
$$

As you can see, using the logarithm leads to the same result, but is much simpler to calculate with, especially when we have many uncertainties we want to add up.

## The Father of Information Theory

It was Claude Shannon, an American mathematician and electrical engineer, who transformed how we think about and handle information. Born in 1916, Shannon's most influential work came during his time at Bell Labs. In 1948, he published "A Mathematical Theory of Communication," which laid the groundwork for information theory. His pioneering ideas made it possible to compress data, detect and correct errors, and improve digital communication systems. These contributions are fundamental to the digital age, influencing everything from smartphones to satellite communications.

Information theory is essential for understanding and managing the transfer and storage of information in modern systems. Think about how you use the internet daily – streaming videos, sending emails, or downloading files. All these activities rely on efficient data communication. Information theory provides the tools to compress data to save storage space, correct errors during data transmission, and optimize communication channels for speed and reliability. Without Shannon’s theories, our current technology, like smartphones and data encryption methods, would be far less efficient and reliable.

## Bit - The Smallest Unit of Information

{% embed url="https://winf-hsos.github.io/university-docs/images/permutations_a_no_information.png" %}
With only the symbol A, no variation and thus no information is possible.
{% endembed %}
