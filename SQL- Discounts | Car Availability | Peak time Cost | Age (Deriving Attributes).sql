-- DERIVED ATTRIBUTES QUERIES:
--------------------------------
-- ALL THESE CALCULATED FIELDS ARE FROM THE Booking TABLE:

-- /1. priceVariancePercentage:

--/ @standard demand is a variable that stores the standard demand of 
SET @standardDemand := 100;
SET @demand := (SELECT COUNT(bookingId) FROM Booking);

SET @priceVariancePercentage := 
	(SELECT
		(( ((SELECT @demand) - 
			 (SELECT @standardDemand)) /
			(((SELECT @demand) + 
	  		 (SELECT @standardDemand)) / 2)
		) * 100) / 50 AS priceVariancePercentage 
	FROM Booking
	GROUP BY priceVariancePercentage);

SELECT @priceVariancePercentage;

-- /2. PRICE AFTER APPLYING ALL HIRE PRICE POLICIES:
SELECT bookingID,
	   Vehicle.standardHirePrice, 
	   Vehicle.company, 
	   Vehicle.model, 
	   (DATEDIFF(Booking.endDate, Booking.startDate)) AS bookingDuration,
	   ((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHßirePrice)) AS totalStandardPrice,

       CASE
    		WHEN (DATEDIFF(Booking.endDate, Booking.startDate)) >= 7
    				THEN (((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHirePrice)) - 
    					  (((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHirePrice))*0.2))
    					 +
    					 (((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHirePrice)) * 
       		 			  (SELECT @priceVariancePercentage / 100))
    		ELSE ((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHirePrice))
    			 +
    			 (((DATEDIFF(Booking.endDate, Booking.startDate))*(standardHirePrice)) * 
       		 	  (SELECT @priceVariancePercentage / 100)) 
       END AS finalHirePrice 

       FROM Booking, Vehicle
       WHERE Vehicle.numberPlate = vehicleBooked
       GROUP BY bookingID;

-- /3. age:
       SELECT TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS Age FROM Driver;

-- /4. This is for the derived attribute IsAvailable.
SELECT numberPlate,
	   vehicle.company,
       vehicle.model,
       TIMESTAMPDIFF(DAY, ServiceStartDate, ServiceEndDate) AS ServiceDuration,
       CASE 
           WHEN (DATE(booking.StartDate)>=DATE(vehicle.ServiceStartDate)) & (DATE(booking.EndDate)<=DATE(vehicle.ServiceEndDate))
                 THEN "N"
             ELSE
                 "Y"
       END AS IsAvailable
       FROM booking,vehicle
       GROUP BY numberPlate;
