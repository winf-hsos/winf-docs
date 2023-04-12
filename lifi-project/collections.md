---
description: >-
  When solving problems using computers, we often need more than just variables
  with single values. In this lesson, we learn about collections as useful data
  structures for our project.
---

# 9 - Collections ⭐

<details>

<summary>Summary</summary>

In this lesson, you'll learn:

* What a _list_ or an _array_ is in programming.
* What a _dictionary_ or a _map_ is and when it's useful.
* The idea of a _set_ is and when it's useful.
* Which other useful data structures exist and what they are good for.

This lesson is relevant for [Exercise 3: On and Off](https://github.com/winf-hsos/lifi-exercises/blob/main/exercises/03\_exercise\_on\_and\_off.pdf).

</details>

In the world of programming, managing and organizing data is crucial. <mark style="background-color:green;">**Collections**</mark> allow us to efficiently store and manipulate groups of related data. Instead of using multiple variables for individual <mark style="background-color:green;">**data points**</mark>, collections help us to store these data points together, making the code more organized, readable, and scalable. In this lesson, we will explore the concept of collections with a focus on <mark style="background-color:green;">**arrays**</mark>, <mark style="background-color:green;">**dictionaries**</mark>, and <mark style="background-color:green;">**sets**</mark>. We'll learn about the general concepts and how we can use them in Python.

## Lists Or Arrays

An array is a collection of elements, usually of the same data type, stored in contiguous memory locations. Arrays are particularly useful when working with a large number of related data points, as they can be easily accessed and manipulated using <mark style="background-color:green;">**indices**</mark>.

Consider the example below, in which we want to store the prime numbers below 20. A suitable data structure could be an array, in which each prime number has its fixed place and an <mark style="background-color:green;">**index**</mark> starting at 0 and counting upwards.

<img src="../.gitbook/assets/file.excalidraw (4).svg" alt="An array is an indexed list, which means every item has its place." class="gitbook-drawing">



Creating an array in Python is simple, and we can do it by enclosing a comma-separated list of elements in square brackets:

```python
primes = [2, 3, 5, 7, 11, 13, 17, 19]
```

Having the prime number stored in a list, we can access individual elements using their indices, such as `prime_numbers[0]` for the first element, `prime_numbers[1]` for the second and so on.

Besides accessing the elements, we can perform various other operations

### Add Elements

In Python, you can add elements to an array (or a list) in various ways, such as using the `append`, `extend`, and `insert` methods or list concatenation. Let's use the same example of prime numbers below 20 and demonstrate different ways to add elements:

```python
primes = [2, 3, 5, 7, 11, 13, 17, 19]

# Add a single element using append()
primes.append(23)
print(primes)  # Output: [2, 3, 5, 7, 11, 13, 17, 19, 23]

# Add multiple elements using extend()
primes.extend([29, 31])
print(primes)  # Output: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

# Add a single element at a specific position using insert()
primes.insert(1, 1)
print(primes)  # Output: [2, 1, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

# Add multiple elements using list concatenation
primes = primes + [37, 41]
print(primes)  # Output: [2, 1, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]
```

In this example, we added elements to the `primes` list using four different methods:

1. `append`: This method adds a single element to the end of the list.
2. `extend`: This method appends multiple elements (an iterable) to the end of the list.
3. `insert`: This method inserts a single element at a specific position in the list. In this case, we inserted the number 1 at index 1.
4. List concatenation: We created a new list by concatenating the `primes` list with another list containing the elements `[37, 41]`.

These methods allow you to add elements to a list in Python, depending on your specific requirements.

### Remove Elements

In Python, you can remove elements from an array (or a list) in various ways, such as using the `remove`, `pop`, and `del` methods or list comprehension. Let's use the example of prime numbers below 20, and demonstrate different ways to remove elements:

```python
primes = [2, 3, 5, 7, 11, 13, 17, 19]

# Remove a specific element by value using remove()
primes.remove(11)
print(primes)  # Output: [2, 3, 5, 7, 13, 17, 19]

# Remove an element by index using pop()
removed_element = primes.pop(2)
print(primes)  # Output: [2, 3, 7, 13, 17, 19]
print(removed_element)  # Output: 5

# Remove an element by index using del
del primes[1]
print(primes)  # Output: [2, 7, 13, 17, 19]

# Remove elements based on a condition using list comprehension
primes = [2, 3, 5, 7, 11, 13, 17, 19]
primes = [x for x in primes if x != 7]
print(primes)  # Output: [2, 3, 5, 11, 13, 17, 19]
```

In this example, we removed elements from the `primes` list using four different methods:

1. `remove`: This method removes the first occurrence of a specific element by value. In this case, we removed the number 11 from the list.
2. `pop`: This method removes and returns an element by index. If no index is provided, it removes the last element of the list. In this case, we removed the element at index 2 (the number 5) from the list.
3. `del`: This keyword is used to remove an element by index. In this case, we removed the element at index 1 (the number 3) from the list.
4. List comprehension: We created a new list by iterating through the `primes` list and including only elements that do not meet the specified condition (in this case, the number 7).

These methods allow you to remove elements from a list in Python based on different criteria, such as value, index, or a specific condition.

### Filter

Filtering an array involves selecting elements from the array based on a specific condition or criteria. In Python, you can filter an array (or a list) using list comprehensions or the built-in `filter` function, which requires a function to define the filtering condition.

Let's use the same example of prime numbers below 20 and filter the primes that are greater than 10:

```python
primes = [2, 3, 5, 7, 11, 13, 17, 19]

# Filter using list comprehension
greater_than_10 = [x for x in primes if x > 10]
print(greater_than_10)  # Output: [11, 13, 17, 19]

# Filter using the filter() function
def is_greater_than_10(num):
    return num > 10

filtered_primes = list(filter(is_greater_than_10, primes))
print(filtered_primes)  # Output: [11, 13, 17, 19]
```

In this example, we filtered the `primes` array using two methods:

1. List comprehension: We used a compact and readable syntax to create a new list by iterating through the `primes` array and including only elements greater than 10.
2. `filter` function: We defined a function `is_greater_than_10` that returns `True` for numbers greater than 10. Then, we used the `filter` function to apply this condition to the `primes` array. The `filter` function returns an iterable, so we converted it to a list using the `list` constructor.

Both methods result in a new filtered list `[11, 13, 17, 19]`, containing prime numbers greater than 10.

### Slice

Slicing an array means extracting a portion of the array by specifying the start and end indices. In Python, you can slice an array (or a list) using the colon `:` operator inside square brackets. The syntax for slicing is `array[start:end]`, where `start` is the index of the first element you want to include, and `end` is the index of the first element you wish to exclude. Both `start` and `end` are optional. If omitted, the slice starts from the beginning or goes to the end of the array, respectively.

Here's an example using the array of prime numbers below 20:

```python
primes = [2, 3, 5, 7, 11, 13, 17, 19]

# Slice the first three prime numbers
first_three_primes = primes[0:3]
print(first_three_primes)  # Output: [2, 3, 5]

# Slice the last three prime numbers
last_three_primes = primes[-3:]
print(last_three_primes)  # Output: [13, 17, 19]

# Slice the prime numbers from index 2 to index 4 (inclusive)
middle_primes = primes[2:5]
print(middle_primes)  # Output: [5, 7, 11]
```

In this example, we created three slices of the `primes` array: one containing the first three prime numbers, one containing the last three prime numbers, and one containing the prime numbers between indices 2 and 4 (inclusive).

### Sort

In Python, you can sort the elements in an array (or a list) using the built-in `sorted` function or the `sort` method. Let's use a modified version of the prime numbers example, with the elements shuffled:

```python
primes = [11, 2, 19, 5, 17, 13, 7, 3]

# Sort the list using the sorted() function (returns a new sorted list)
sorted_primes = sorted(primes)
print(sorted_primes)  # Output: [2, 3, 5, 7, 11, 13, 17, 19]

# Sort the list in descending order using the sorted() function
sorted_primes_desc = sorted(primes, reverse=True)
print(sorted_primes_desc)  # Output: [19, 17, 13, 11, 7, 5, 3, 2]

# Sort the list in-place using the sort() method (modifies the original list)
primes.sort()
print(primes)  # Output: [2, 3, 5, 7, 11, 13, 17, 19]

# Sort the list in-place in descending order using the sort() method
primes.sort(reverse=True)
print(primes)  # Output: [19, 17, 13, 11, 7, 5, 3, 2]
```

In this example, we sorted the `primes` list using two different methods:

1. `sorted`: This function returns a new sorted list from the elements of the given iterable. By default, the sorting is in ascending order. To sort in descending order, you can set the `reverse` parameter to `True`.
2. `sort`: This method sorts the elements of a list in-place (i.e., it modifies the original list). Similar to the `sorted` function, you can use the `reverse` parameter to sort the list in descending order.

Both the `sorted` function and the `sort` method allow you to sort a list in Python based on the natural order of the elements (i.e., ascending or descending). If you need custom sorting, you can use the `key` parameter to provide a function that determines the sort order.

## Dictionaries

A dictionary is another type of collection that stores data in <mark style="background-color:green;">**key-value pairs**</mark>. It allows us to retrieve a value based on its unique key, making it ideal for scenarios where data items have a specific relationship or attribute, or when we want to look things up.

Consider the example of the ASCII codes below. We wish to translate a letter the user enters via the keyboard into the binary ASCII code, so we can transmit the letter via LiFi. We could say we want to look up the binary code for every letter in the alphabet and use a dictionary for that.

<img src="../.gitbook/assets/file.excalidraw (7).svg" alt="A dictionary stores data as key-value-pairs." class="gitbook-drawing">

In Python, dictionaries are created using curly braces `{}` or the `dict()` constructor. Let's create the dictionary for the example above:

```python
codes = { "A" : "01000001", "B" : "01000010", "C" : "01000011" }
```

In this dictionary, the letters "A", "B", and "C" are keys, and the binary codes are the values. You can access individual elements using their keys, such as `codes["A"]` for the binary code of the letter "A".

Dictionaries in Python support various operations like adding key-value pairs, removing pairs, updating values, and more.

### Adding Pairs

```python
codes["D"] = "01000100"
```

### Removing Pairs

```python
removed = codes.pop("D")
```

### Updating Values

```python
codes["C"] = "hello"
```

### Check Existence

```python
if 'D' in codes:
    print('D is in the dictionary')
else:
    print('D does not exist in the dictionary')
```

## Sets

A set is a collection of unique, unordered elements. It is useful in situations where you want to store distinct elements and perform operations like union, intersection, or subtraction.

<img src="../.gitbook/assets/file.excalidraw (13).svg" alt="A set has no order and only unique items." class="gitbook-drawing">

In Python, sets can be created using the `set()` constructor or by using curly braces `{}` with a comma-separated list of unique elements.

```python
colors = { "orange", "orange", "orange", "green", "green", "green", "blue", "blue" }
print(colors) # Output: {'blue', 'orange', 'green'}

colors_list = [ "orange", "orange", "orange", "green", "green", "green", "blue", "blue" ]
colors_set = set(colors_list)
print(colors_set) # Output: {'blue', 'orange', 'green'}
```

## More Collections

The idea of lists, dictionaries, and sets will be sufficient to improve many of our programs we write during the LiFi project. However, programmers sometimes require more specialized data structures, some of which I list below. Click on the link to find out more about them:&#x20;

* Queue
* Stack
