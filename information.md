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

If $$H_0$$ is the uncertainty before we receive the answer to our question, and $$H_1$$ is the uncertainty after we considered the answer, then the  information $$I$$ we gained with this answer is the difference between both uncertainties:

$$
I = H_0 - H_1
$$

Information is thus the amount of reduced uncertainty.

With this formula, we can easily calculate the information we get for any question we ask, regardless of whether it eliminates half or less of the remaining possibilities. Let's consider the example when our first question is "Is your number greater than 12?" and the answer is "no". We are left with the numbers 1 through 12, and only 4 possible numbers are removed:

$$
I = log_2(16) - log_2(12) = 4 - 3.585 =  0.415
$$

With around 0.415 bits, the answer gave us less than one bit of information.&#x20;

What if the answer was "yes"? We would then be left with the possible numbers 13, 14, 15, and 16, which are four possible options:

$$
I = log_2(16) - log_2(4) = 4 - 2 = 2\text{ bits}
$$

This answer yielded more than one bit, namely 2 bits. How can this be?

## Less Likely Answers

REWRITE FROM HERE

The answer lies in the probability of the answer you receive. If you ask a question that eliminates half the possibilities, your probability of receiving as "yes" is the same as "no". Both answers have a chance of 50%. That is, if the number was randomly chosen, which we assume here.&#x20;

However, asking "Is the number greater than 12?" will more likely be answered with "no" than with "yes". There are 12 numbers that would yield a "no", and only 4 that would yield a "yes".  Therefore, the chances are 75% for "no" and only 25% for "yes".

A "yes" would be more surprising to you than a "no", simply because it is less likely. We can say that the degree of surprise is equal to the amount of information you get. A "yes" is more surprising and thus contains more information. How much? Well, as we saw, 2 bits compared to 0.415 bits.&#x20;

The answer "no" is less surprising compared to the "yes". And compared to a situation where both answers are equally likely, when we ask a question that halves the possibilities, where we get exactly one bit.

I told you earlier that asking the kind of questions that systematically remove exactly half the possibilities is maximizing our information gain. Why? We could calculate the average amount of information we get, or the expected amount, by weighting the bits we get with their respective probabilities:

$$
E[I] = (0.25 \times 2) + (0.75 \times 0.415) = 0.811 \text{ bits}
$$

We can generalize this formula for any number of answers with different probabilities as follows:

$$
E[I] = -\sum_{i=1}^{S}p(x_i)\times log_2(p(x_i))
$$

Let's replace the values with the one from the example:

$$
E[I] = -[p(\text{yes})\times log_2(p(\text{yes})) + p(\text{no})\times log_2(p(\text{no}))]
$$

Which makes:

$$
E[I] = -[0.25\times log_2(0.25)) + 0.75\times log_2(0.75))]
$$

$$
E[I] = -[-0.5 - 0.311)] = 0.811
$$

## From Questions to Symbols

## The Smallest Unit of Information

{% embed url="https://winf-hsos.github.io/university-docs/images/permutations_a_no_information.png" %}
With only the symbol A, no variation and thus no information is possible.
{% endembed %}
