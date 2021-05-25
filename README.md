### Codeclan Health Dashboard
 CodeClan group project - Scottish health dashboard
 
## Repository Description
This repository contains the data and R files used in the CodeClan group project to create a dashboard and presentation using Scottish health statistics.

## Group Members
- Jonathan D'Costa 
- Emily Jaco 
-  John Wood

## Roles & responsibilities of each member
*Jonathan D'Costa worked on*

Emily Jaco worked on part 1: the Scottish Health Survey Local Data. She began by reviewing the different survey categories and selecting 4 categories to look at in greater detail: Smokers, Alcohol drinkers, E-cigarette users and obesity levels. She used spatial data that was divided by the Health Boards in Scotland and created geographical ggplot spreads with a colour range from green and red based on low to high percentages. 

*John Wood worked on …*

*Everyone worked on …*

## Brief description of dashboard topic
*Our dashboard contains …*

*Our health topic is …*

*The dashboard outlines our health topic in terms of …*

## Which tools were used in the project
Zoom (daily stand-ups and occasional mob programming)
Git/GitHub (collaboration & version control)
R Studio (with the below libraries)

## Libraries used
1. tidyverse
2. janitor
3. here
4. shiny
5. shinydashboard
6. ggplot2
7. skimr
8. DT
9. sf
10. leaflet
11. rmapshaper

## Structure
The project is structured as follows:

### 1. data_raw
This folder contains the raw data downloaded from the Scottish Government statistics website [statistics.gov.home]
(https://statistics.gov.scot/home)

### 2. data_ cleaning_scripts
This folder contains .R scripts used to clean and transform the data into Tidy format.

### 3. data_clean
This folder contains the clean data produced by the .R scripts.

### 4. notebooks
This folder contains the .RMD notebooks which perform the analsyis, create the Shiny app and produce the results.

### 5. output
This folder contains all outputs.

## Stages of the project
* Researched existing dashboards and Scotland Public Health data sets
* Created Github repo and relevant folders to organise
* Developed a wireframe markup
* Reviewed data as a team and selected points of interest 
* Team members split up to work on different tasks of the project i.e. data handling and app development
* Creation of UI along with simultaneous data handling
* Entered data into the app and made changes to the UI as required

## How did you gather and synthesise requirements for the project?
*We synthesised the information given in the brief by …*

*We prioritised …*

## Motivations for using the data you have chosen
For part 1 the team chose to use the dataset on the Scottish Health Survey Local Data because they found it was an interesting overview into health levels across Scotland. Visualising this data gave a good insight into the 14 different Health Boards across Scotland broken down by sex (All, Female, Male) and year (2015-2018 and 2016-2019). It also would be a great data set to add future years to as you could compare with previous years to see any key changes. 

*For part 2...*

## Data quality and potential bias, including a brief summary of data cleaning and transformations
*According to the About tab on the dataset page/dedicated page online, the data quality …*

The dataset may not be biased because there is a high level of anonymisation from the data i.e. there are at least 3-5 degrees that separate an individual from being identified. 

As the data was pre-cleaned there wasn't a huge amount of cleaning to be done, however, the team spent time reviewing the data to see what would be the most beneficial to the project. Following that they spent time wrangling the data to best present the data in visualisations. 

## How is the data on statistics.gov.scot stored and structured

The data on statistics.gov.scot is in the form of Linked Data - any data point contained in a Linked Dataset should have a unique identiifer which is a URL. The datastore on statistics.gov.scot is in the form  of millions of statements, or ‘triples’ which is a combination of three bits of information that form a subject - predicate - object arrangement. 

This means that the data point can be browsed using a web browser and that the data point can be refernced by other Linked Data sets. 

Benefits of storing the data like this are that the structure of the database is contained within the data so there is no need to have complex databases. 

## Ethical and legal considerations of the data

*There are no/There may be ethical considerations, because …*

The datasets are covered by the Open Government License, which means individuals or businesses in the public sector are allowed to license the use and re-use of the National Archives information under a common open licence. 
