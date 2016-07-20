# Prerequisites
#
# Revolution R Open 3.2.2 for Revolution R Enterprise 7.5.0
# https://www.microsoft.com/en-us/download/confirmation.aspx?id=49525
#
# Revolution R Enterprise 7.5.0 Server (RRE-7.5.0)
# https://www.microsoft.com/en-us/download/details.aspx?id=49505

# Load the RevoScaleR package 
library(RevoScaleR)

# Define parameters for the connection
conStr <- "Driver=SQL Server; Server=localhost;Database=RtestDb;Uid=r_user;Pwd=rpdw"
sqlShareDir <- paste("C:\\Code\\R\\SandR\\temp\\", Sys.getenv("USERNAME"), sep="")
sqlWait <- TRUE
sqlConsoleOutput <- TRUE

# Create the compute context to SQL Server 2016
cc <- RxInSqlServer(connectionString=conStr, 
                    shareDir = sqlShareDir,
                    wait = sqlWait,
                    consoleOutput = sqlConsoleOutput)

rxSetComputeContext(cc)
