---
description: >-
  The LiFi appliance's task is to convey information via light signals. But what
  exactly is information, and how can we measure it?
---

# Information

One fascinating aspect of computers and information technology is their ability to transmit information over distances, from one sender to a receiver. Think about the last time you sent a message via WhatsApp. As soon as you hit 'send,' your message traveled through various media (e.g., electromagnetic waves, copper cables, fiber optic cables) before arriving at your friend's smartphone. This process is not limited to messaging; it happens when you send emails, share files, stream videos, or listen to music or podcasts.

Understanding how information is transmitted is essential for various technologies, including the LiFi project. What sets LiFi apart is the medium over which information travels: information should be transmitted using only light signals. To comprehend this, we need to understand how information is represented, stored, and processed by digital computers, and how it is shared among different devices. This journey begins with a fundamental question: what exactly is information in the context of computers?

In this chapter, we will define the term “information” and introduce a way to quantify it. This understanding is essential, especially when determining how much information our LiFi appliance can send within a given time frame. Let's dive into the details and uncover the essence of information, as this will be crucial for our exploration of the digital world.

## Guessing Numbers

Let's start with a thought experiment. Imagine we are playing a number guessing game. I am thinking of a number between 1 and 16, and your goal is to guess it. The catch is that you have only one guess to get the right number, but you can narrow down the possibilities beforehand with questions in the form of "Is the number greater than X". For each question, I will tell you "yes" or "no", effectively reducing the options you are left with.&#x20;

With each answer you get, your knowledge about my number increases, which means your <mark style="background-color:blue;">**uncertainty**</mark> decreases. You can rule out some possible numbers when you receive a new answer.&#x20;

Now that we've seen how systematically narrowing down possibilities reduces uncertainty, let's explore how this concept forms the basis of information theory. By reducing uncertainty, you gather more <mark style="background-color:blue;">**information**</mark> with each guess. But how much information do you get with each answer? And how can we measure this?

{% embed url="https://winf-hsos.github.io/university-docs/images/number_guessing_game_1.png" %}
I am thinking of a number between 1 and 16. Your task is to guess the number with the fewest questions possible.
{% endembed %}

## Bits of Information

In computer science, information can be defined as "that which allows you to make a correct prediction with accuracy better than chance" \[<mark style="background-color:orange;">CITE</mark>]. In more straightforward terms, this means reducing uncertainty by narrowing down the number of possible options.

With this in mind, let’s revisit our number guessing game. Imagine you are trying to guess a number, and each answer you receive narrows down the range of possible numbers. This reduction of uncertainty can be measured using a unit called a <mark style="background-color:blue;">**bit**</mark>. A bit, which stands for <mark style="background-color:blue;">**binary digit**</mark>, is the fundamental unit of information. It indicates a reduction of uncertainty by half. In simpler terms, if a new answer leaves us with half as many options as before, it provides us with one bit of information.

However, not all questions will provide exactly one bit of information. For example, if your first question in the guessing game is, "Is your number greater than 12?" and the answer is "no," you’re left with the numbers 1 through 12. This means you have 12 options remaining out of the original 16, which doesn't quite halve the uncertainty.

To receive one bit of information, you should aim to eliminate exactly half the possible numbers with each question. For instance, asking "Is your number greater than 8?" ensures that whether the answer is "yes" or "no," you are left with 8 possible numbers either way. If the answer is "yes," the remaining numbers are 9 through 16. If the answer is "no," the remaining numbers are 1 through 8. In both scenarios, your uncertainty is reduced by half, or one bit.

By carefully choosing your questions to cut the remaining options in half each time, you effectively reduce your uncertainty bit by bit, making it easier and faster to zero in on the correct number.

{% embed url="https://winf-hsos.github.io/university-docs/images/number_guessing_game_2.png" %}
Your questions should cut the number of possibilties in half.
{% endembed %}

Assume the answer to your first question, "Is your number greater than 8?" was "no." What should your next question be to continue reducing uncertainty effectively? The best strategy is to ask, "Is it greater than 4?" This approach ensures that you will always be left with only four possible numbers: either 1 through 4 if the answer is "no", or 5 through 8 if the answer is "yes". Again, this cuts the remaining options in half, providing exactly one bit of information.

{% embed url="https://winf-hsos.github.io/university-docs/images/number_guessing_game_3.png" %}
After two questions, you are left with 4 possible numbers.
{% endembed %}

Let's continue with this method. Suppose your second question "Is it greater than 4?" receives a "no" as the answer. Your new pool of numbers is limited to 1, 2, 3, and 4. To keep reducing uncertainty, the next logical question would be, "Is it greater than 2?" This leaves you either with the numbers 1 and 2 or 3 and 4, depending on the answer.

By continuing to ask questions that systematically halve the remaining options, you can see how we gradually reduce uncertainty bit by bit. Eventually, after just four questions, you will narrow it down to exactly one number, knowing there are no other possibilities left. This means you've reduced the uncertainty to zero.

{% embed url="https://winf-hsos.github.io/university-docs/images/number_guessing_game_6.png" %}
It takes 4 yes/no questions to reduce the options from 16 to a single one.
{% endembed %}

## Uncertainty

We've just learned that with each yes/no question that eliminates half of the possibilities, we gain one bit of information. But how do we quantify this concept of uncertainty mathematically? Let's break it down step-by-step.

Imagine you are at the beginning of our number guessing game. There are 16 possible numbers I could be thinking of, so your probability of guessing the correct number on the first try is quite low:

$$
P_{correct} = \frac{1}{16}
$$

That's a mere 0.0625 probability—definitely not in your favor. Suppose you ask a question that narrows down the possibilities to half. Now, your chance of guessing correctly improves:

$$
P_{correct} = \frac{1}{8}
$$

With each successive question, this probability doubles, while your uncertainty halves. Is probability the best way to measure uncertainty? If we want our measure of uncertainty to decrease as we gather more information, it makes sense to use the inverse of probability.

Initially, there are 16 possibilities, so the uncertainty starts at 16. After the first question, it drops to 8, then to 4, 2, and finally 1. However, even if only one option remains, this measure would tell us there is still some uncertainty (1), which doesn't quite fit our intuitive understanding.

Claude Shannon, the pioneering figure in information theory, proposed a different approach. He suggested measuring uncertainty using the base-2 logarithm of the number of possibilities:

$$
H = \log_2 (N)
$$

This method has several advantages. Firstly, if there's only one possible answer (N=1), the uncertainty is zero, which aligns with our intuition:

$$
\log_2 (1) = 0
$$

Another advantage is the simplicity in calculations, especially when dealing with multiple independent uncertainties. Let's say the game changes: now I am thinking of two independent numbers between 1 and 16. Before asking any questions, your uncertainty for each number is:

$$
\log_2 (16) = 4 \text{ bits}
$$

The total uncertainty for both numbers is just the sum of their individual uncertainties:

$$
\log_2 (16) + \log_2 (16) = 4 + 4 = 8 \text{ bits}
$$

If we use probabilities instead, we would multiply the chances to find the probability of guessing both numbers correctly:

$$
P_{correct, correct} = \frac{1}{16} \times \frac{1}{16} = \frac{1}{256}
$$

With both numbers, there are 256 possibilities. Using Shannon's method, we get the same result:

$$
\log_2 (256) = 8 \text{ bits}
$$

As you can see, using logarithms simplifies our calculations, especially when dealing with multiple sources of uncertainty. This clarity and simplicity are why Shannon's approach has become fundamental in the field of information theory.

## Information

If we begin by considering the uncertainty before asking a question, we assign it a value $$H_0$$. After receiving an answer, we measure the new level of uncertainty as $$H_1$$. The amount of information $$I$$ we gain from the answer is simply the difference between these two uncertainties:

$$
I = H_0 - H_1
$$

In essence, information is the reduction in uncertainty.

This formula allows us to compute the information obtained from any question, regardless of how many possibilities it eliminates. Let's revisit our number guessing game to see this in action. Suppose your first question is, "Is your number greater than 12?" If the answer is "no," you are left with numbers 1 through 12. Here’s how we calculate the information gained:

$$
I = log_2(16) - log_2(12) = 4 - 3.585 =  0.415
$$

In this case, the answer provided around 0.415 bits of information, which is less than one bit.

What if the answer was "yes"? We would then be left with the possible numbers 13, 14, 15, and 16, which are four possible options:

$$
I = log_2(16) - log_2(4) = 4 - 2 = 2\text{ bits}
$$

This answer gave us more than one bit, specifically 2 bits. Why is there such a disparity?

## Less Likely Answers

The difference in information comes down to the likelihood of receiving each answer. When a question eliminates half the possibilities, each possible answer ("yes" or "no") has an equal probability of 50%. This balance simplifies the calculation, yielding exactly one bit of information.

However, asking "Is your number greater than 12?" is less balanced. There are 12 possible numbers that give a "no" and only 4 that give a "yes", giving probabilities of 75% for "no" and 25% for "yes." The "yes" answer is less likely and thus more surprising – it provides more information. As we calculated, a "yes" yields 2 bits of information, whereas a "no" provides 0.415 bits.

This surprise factor ties directly into information theory: the less likely an event, the more informative its occurrence. Conversely, a "no" answer is less surprising and therefore provides less information.

So, why do we aim to ask questions that evenly halve the possibilities? Because it maximizes our expected information gain. Let’s calculate the expected information from our earlier question:

$$
E[I] = (0.25 \times 2) + (0.75 \times 0.415) = 0.811 \text{ bits}
$$

This isn't as efficient as consistently gaining one bit per question. We can generalize this calculation for any number of answers with varying probabilities using the formula:

$$
E[I] = -\sum_{i=1}^{S}p(x_i)\times log_2(p(x_i))
$$

For our example, this becomes:

$$
E[I] = -[p(\text{yes})\times log_2(p(\text{yes})) + p(\text{no})\times log_2(p(\text{no}))]
$$

Substituting the probabilities, we get:

$$
E[I] = -[0.25\times log_2(0.25)) + 0.75\times log_2(0.75))]
$$

Simplifying further:

$$
E[I] = -[-0.5 - 0.311)] = 0.811
$$

This calculation confirms that targeted questions eliminating half the possibilities indeed maximize our information gain.

## From Questions to Symbols

Now that we've established how to measure information through targeted questions, let's delve into another integral aspect of information theory: symbols. In real-world applications, information isn't just conveyed through yes/no questions but also through a variety of symbols and signals.

## The Smallest Unit of Information

Expanding on the idea of bits, we measure information using bits because they represent the most basic, binary choice: yes or no, 0 or 1. Every digital communication, whether it's text, audio, or video, breaks down into binary digits.

In our previous example, every yes/no question we asked in our guessing game can be thought of as a bit of information. When we generalize this process for any form of data transmission – whether through text messages, streaming videos, or even controlling smart devices – we are continually breaking down and managing bits of information.

{% embed url="https://winf-hsos.github.io/university-docs/images/permutations_a_no_information.png" %}
With only the symbol A, no variation and thus no information is possible.
{% endembed %}
