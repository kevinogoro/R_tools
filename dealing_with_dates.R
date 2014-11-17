# Import dataset
usage<-read.csv("11_08_2014usage.txt", header=TRUE, sep="|")
# View(usage)
# I like using names because it helps me to check whether I have imported data
# the way i wanted to
names(usage)
# although I have a variable caled date in the dataset
# I still have to tell R that this is a date field
# And I do so by using the as.Date() function
proper_date<-as.Date(usage$date, "%m/%d/%Y")
# proper_date is now a vector of dates
# I use the summary() function to confirm the same
summary(proper_date)
# Now that I have created a new vector of dates from the date column
# I need to combine it with the original dataset
# For that I use the cbind() function
new_usage<-cbind(usage,proper_date)
# Again, I use the names() function to confirm that it has done what i wanted
names(new_usage)
# So now I want to create a subset from the dataset
# For observations that occured between two dates
# There are two possible routes
# The first is defining the two date variables as dates
b4_jun<-as.Date("5/31/2014", "%m/%d/%Y")
aft_jun<-as.Date("7/1/2014", "%m/%d/%Y")
# We then subset the dataset again with the two date variabes as constraints
new_usage_oct<-subset(new_usage, proper_date > b4_jun & proper_date < aft_jun)
# Route 2
# We subset the data and define the date values within the constraint expressions
new_usage_oct<-subset(new_usage, proper_date > as.Date("5/31/2014", "%m/%d/%Y") & proper_date < as.Date("7/1/2014", "%m/%d/%Y"))
# Again, use the summary() formula to confirm results
summary(new_usage_oct$proper_date)
