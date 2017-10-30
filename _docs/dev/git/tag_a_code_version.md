---
title: Tag a Code Version
layout: doc
---

In our classes' group projects, code deliverables are due at certain deadlines. To submit the group's results, we use GitHub to check-in the latest working code version. To keep track of the different deliverables, we put tags on each code submission. The following descibes how to tag a code submission.

## Create a Tag

To create a tag, use the following command after you checked in your code:

```git tag -a <tag> -m 'Tag for group <group-no> deliverable on <YYYY-MM-DD>'```

Replace the placeholder as follows:

- `<tag>` - Replace with the current phase that has ended with this commit. For example, if the code relfects the results of phase 2, it should be **v2.0**
- `<group-no>` - Replace with your group number
- `<YYYY-MM-DD>` - Replace with the due date of this code deliverable. For example if the code is due on 22.12.2017, replace with **2017-12-22**

So after replacement, the command should look like this:

```git tag -a v2.0 -m 'Tag for group 1 deliverable on 2017-12-22'```

