# File: UsageExample.R
# Auth: u.niazi@soton.ac.uk
# DESC: connect to the database and run SQL queries
# Date: 12/6/2024

# connect to database
library(DBI)
library(RMySQL)

con = dbConnect(MySQL(), 
                host = '127.0.0.1',
                dbname = 'sctu_sqldb',
                user = rstudioapi::askForPassword("Database user"),
                password = rstudioapi::askForPassword("Database password"))

dbGetQuery(con, 'describe study')

## create a test data frame as example
dfStudy = data.frame(StudyName=c('my study 1', 'my study 2'),
                     Disease=c('disease A', 'disease B'))

### to a test insert first
dfStudy[1,]
dbWriteTable(con, name='study', value = dfStudy[1,], append=T, row.names=F)

## running this may sometime give an error which will look like this:
# Error in dbSendQuery(conn, statement, ...) : 
#   could not run statement: Loading local data is disabled; this must be enabled on both the client and server sides
# it is explained here: https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client
# you can get around it by executing:
dbGetQuery(con, 'set global local_infile=true;')

## test was successful, enter the other data
dbWriteTable(con, name='study', value = dfStudy, append=T, row.names=F)

dbDisconnect(con)

#############################################
## some example queries to read data
## how many types of clinical data are for study X
dfRes = dbGetQuery(con, "select count(*) counts, Type from clinicaldata
where Study_idStudy=2
group by Type")

head(dfRes)
