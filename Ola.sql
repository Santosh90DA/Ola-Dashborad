create Database if not exists ola;
use ola;
select * from bookings;
select count(Customer_ID) from bookings ;
# Retrieve all successful bookings:
create view successful_bookings as
 select * from bookings where Booking_Status = "Success";
 
select * from  successful_bookings ;

# Find the average ride distance for each vehicle type:
create view Ride_Distance_For_each_vehicle as
select Vehicle_Type , avg(Ride_Distance) as avg_Distance from bookings group by Vehicle_Type;

Select * from Ride_Distance_For_each_vehicle ;	

# Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from bookings where Booking_Status = "Canceled by Driver";

select * from cancelled_rides_by_customers ;

# List the top 5 customers who booked the highest number of rides:
create view top_5_Customer as 
select Customer_ID,count(Booking_ID) as total_rides 
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from top_5_Customer ;

# Get the number of rides cancelled by drivers due to personal and car-related issues:
create view  rides_cancelled_by_drivers as
select count(*)  from bookings 
where Canceled_Rides_by_Driver ='Personal & Car related issue';

select * from rides_cancelled_by_drivers ;

#Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as
select Vehicle_type,max(Driver_Ratings) as Max_Rating  ,min(Driver_Ratings)as Min_Rating from bookings where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Rating ;

# Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from bookings where Payment_Method = 'UPI';

select * from UPI_Payment ;

# Find the average customer rating per vehicle type:
create view avg_cust_Rating as
select Vehicle_Type,avg(Customer_Rating) as avg_Cutomer_rating 
from bookings group by Vehicle_Type;

select * from avg_cust_Rating ;

# Calculate the total booking value of rides completed successfully:
create view completed_successfully_rides as
select sum(Booking_Value) as total_successful_value
from bookings 
where Booking_Status = 'Success';

select * from completed_successfully_rides;

#List all incomplete rides along with the reason:
create view Incomplete_Rides_reason as
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = "Yes";

select * from Incomplete_Rides_reason;
 
# 1 Retrieve all successful bookings: 
select * from  successful_bookings ;
 
# 2 Find the average ride distance for each vehicle type: 
Select * from Ride_Distance_For_each_vehicle ;	

# 3 Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers ;

# 4 List the top 5 customers who booked the highest number of rides:
select * from top_5_Customer ;

# 5 Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from rides_cancelled_by_drivers ;

# 6 Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating ;

# 7 Retrieve all rides where payment was made using UPI:
select * from UPI_Payment ;

# 8 Find the average customer rating per vehicle type:
select * from avg_cust_Rating ;

# 9 Calculate the total booking value of rides completed successfully:
select * from completed_successfully_rides;

#List all incomplete rides along with the reason:
select * from Incomplete_Rides_reason;