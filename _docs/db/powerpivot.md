---
title: Microsoft Power Pivot
subtitle: Large Datasets on Desktop
layout: doc
---
# Microsoft Power Pivot

Power Pivot is an add-in for Excel and has been around since Excel 2013. At its core, it is an in-memory datadase on your desktop, living inside an XLS document. Power Pivot achieves high compression rates, so it can hold a comparatively large amount of data in memory (provided the data lends itself to compression). The compression is also applied when storing the data set to hard disk, so the Power Pivot workbook takes surprisingly little space here too.

With Power Pivot, you can overcome traditional limits of Excel when working with large datasets. Maintaining large data sets in an Excel spreadsheet makes the application slow, and analysis of the data becomes impossible at some point. Power Pivot solves this by keeping the data set and the analysis in two separate processes. Only data relevant to the current question is loaded in XLS, for example in a Excel pivot table. This data is usually an aggregated view on the original data, with a size of only a tiny fraction of the original data.

Because Power Pivot holds the data in-memory to achieve fast query response times, the available memory (RAM) of the host computer is crucial to performance. With an average 8 GB laptop you can easily load and analyze many million rows (for testing purposes, I once loaded 100,000,000 rows in 10 minutes).

# Activate Power Pivot Add-In

In Excel 2016, click on **File - Options**. In the window that opens, select the **Add-Ins** tab. Now, at the bottom of the window you should see a dropdown menu where you can specify which type of add-in you want to activate. Select **COM-Add-Ins** and then click the button next to it. In the following pop-up window, activate the checkbox next to the **Microsoft Power Pivot for Excel** entry. Click OK. There should now be a new ribbon called **Power Pivot** in your Excel application.

![screenshot](/img/docs/powerpivot_add_in.png "Power Pivot Ribbon in Excel")

You are now ready to work with Power Pivot!

