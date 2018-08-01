---
title: Integrating R with Power BI
author: Enayet
date: '2018-08-01'
lastmod: '2018-08-01'
slug: integrating-r-with-powerbi-desktop
categories:
  - R
tags:
  - PowerBI
  - R
draft: false
highlight: true

---

*Microsoft Power BI* Desktop version nicely integrates with **R**. R is an open source software for statistical computing and graphics. R has become popular among the data scientists because of its powerful data analytics and visualization capabilities. *Power BI* is Microsoft's flagship BI tool for creating dashboards and interactive reports. With R as a backend support engine for *Power BI Desktop*, you can do many cool things, which can be broadly categorized into three broad applications--

* using R to import data into Power BI, 
* using R to query data existing within Power BI, and 
* running R scripts for creating visuals 

In this article, I will demonstrate how to use R with Power BI to perform these applications.

{{% toc %}}

# Using R to import data sets into Power BI

Power BI can import data from a variety of sources. For a complete list, please see [here.](https://docs.microsoft.com/en-us/power-bi/desktop-data-sources)

Importing Excel `.xlsx` or `.csv` files into Power BI is perhaps the most common usage. However, I've personally found it to be problematic. In particular, if your source data is continuously updating including addition or removal of columns, then the changes do not get updated when you simply refresh the data sources from Power BI Desktop. This is a problematic when you are developing your interactive report and also when the dashboard is in production.

A more robust solution of importing data is to use R script. This is known as [Running R scripts in Power BI Desktop](https://docs.microsoft.com/en-us/power-bi/desktop-r-scripts).

## Preparing the R script in R Studio

This is the stage you would write your R script to load your data. I use R studio for that. RStudio is a popular Integrated Development Environment (IDE) for R. If you are not familiar with RStudio, you can use the default R editor or wherever you write your R codes. You do not need any special preparation. Just use the editor to test your code before using in Power BI.

I am going to create a smiple data set with two columns using the R codes below. This data is being created for demonstration purposes only so that you can reproduce it when you are learning. 

```r
# Sample data frame object

df <- data.frame(
  x= rnorm(100),
  y= rnorm(100) + rnorm(100)
)

head(df)
```

This code creates an R `data.frame` and saves in an object `df`. This will be the name of the data when you import into Power BI. You can give the data object any valid R-name you want. 

The above code also shows `head(df)`, but Power BI only imports `data.frame`. In this case, it will only import the `df` object and ignore the rest. So you don't have to worry about other codes in the script. Just make sure all codes run without error and without any dependencies. 

## Run your R script and import data

In Power BI Desktop, the R Script data connector is found in Get Data menu. Click on **Get Data > More...**, then select **Other > R script** as shown in the following image:

![Get Data using R script](/img/get_data_R_script.png)

![R script interface in Power BI](/img/r_script_interface_powerbi.png)
Notice that at the bottom of the above image, the your R installation path is displayed. If you have multiple installation of R, then you would need to go to **Options and Settings > Options > R scripting** and then setting the location of the R installation you would like to use.

## Error message 

After you enter the R script and hit OK, you might see a connection error message as follows:

![R script interface in Power BI](/img/unable_to_connect_r_script.png)
In that case, you need to click on *Retry* and that will take to you the following message to enable native database query. Click on Run. If you want to know more about risk involved with this option please see the [official documentation](https://support.office.com/en-us/article/import-data-from-database-using-native-database-query-power-query-f4f448ac-70d5-445b-a6ba-302db47a1b00?ui=en-US&rs=en-US&ad=US)

![R script interface in Power BI](/img/enable_native_data_base_query_r_script.png)
After that, it should run without any issue and you should see a window like the following:

![R script interface in Power BI](/img/r_script_navigator_screen.png)
## Loading the data

Once you are at this stage, you select the data frame created with the R script (in this case `df`), and then click Load (or Edit if you want). This should load the data in Power BI. You can verify that in the Fields pane that the `df` has indeeded loaded as shown in the folowing:

![R script interface in Power BI](/img/r_script_fields_pane.png)
Now that you've successfully imported the data using R script, you can use the variables the typical way you would work within Power BI Desktop. If you want to add or edit any new column/variables or anything with the data using the R script, you would need to update the R script and load the data as usual. 

When you edit the R script, you should not see any error/warning messages because you've already made those exceptions. 

## Updating the R script

It is obvious that you would be updating the R script since that was the whole purpose of importing the data via R script. You continue to edit the script in RStudio and when you are ready to update the code within Power BI, you need to go to Edit Queries option. 

Simply right-click on the data under the **FIELDS** pane, and select *Edit query*. This should open the Power Query Editor and you can click on the gear icon ([1] in figure) as shown below:

![Edit R script](/img/edit_r_script.png)
Clicking that gear icon should open the R script editor where you can replace the existing code with the updated code. When you are ready, click OK, and then click **Close \& Apply** ([2] in the figure) in the Power Query Editor to apply the changes.

{{% alert note %}}
The next two sections will be updated shortly...
{{% /alert %}}


# Using R to query data sets within Power BI, and 

# Running R scripts for creating visuals 

