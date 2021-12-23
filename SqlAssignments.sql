Que 1 -> List all the columns of the Salespeople table.

Query -> SELECT snum,sname,city,comm FROM salespeople;
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 12   |
| 1002 | Serres  | SanJose   | 13   |
| 1003 | AxelRod | New York  | 10   |
| 1004 | Motika  | London    | 11   |
| 1007 | Rifkin  | Barcelona | 15   |
| 1008 | Fran    | London    | 25   |
+------+---------+-----------+------+
6 rows in set (0.00 sec)





**************************************************************************************************************************************





Que 2 -> List all customers with a rating of 100.

Query -> SELECT cname FROM Customers  
         WHERE rating = 100;
+---------+
| cname   |
+---------+
| hoffman |
| Clemens |
| Pereira |
+---------+
3 rows in set (0.00 sec)





**************************************************************************************************************************************






Que 3 -> Find the largest order taken by each salesperson on each date.

Query -> mysql> SELECT snum ,odate,MAX(AMT) AS Max_Amount 
         FROM Orders GROUP BY ODATE,SNUM;
+------+------------+------------+
| snum | odate      | Max_Amount |
+------+------------+------------+
| 1001 | 1990-03-10 |     767.19 |
| 1002 | 1990-03-10 |    5160.45 |
| 1004 | 1990-03-10 |     1900.1 |
| 1007 | 1990-03-10 |    1098.16 |
| 1002 | 1990-04-10 |      75.75 |
| 1003 | 1990-04-10 |    1713.23 |
| 1001 | 1990-05-10 |       4723 |
| 1001 | 1990-06-10 |    9891.88 |
| 1002 | 1990-06-10 |    1309.95 |
+------+------------+------------+
9 rows in set (0.00 sec)





**************************************************************************************************************************************





Que 4 ->  Arrange the Order table by descending customer number. 

Query ->  SELECT onum, amt, odate, cnum,snum  
          FROM Orders ORDER  BY cnum DESC;
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3008 |    4723 | 1990-05-10 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-06-10 | 2006 | 1001 |
| 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-06-10 | 2004 | 1002 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.00 sec)





**************************************************************************************************************************************






Que 5 ->  Find which salespeople currently have orders in the order table. 

Query ->   SELECT DISTINCT sname  
           FROM salespeople 
           INNER  JOIN Orders ON salespeople.snum = Orders.snum;
+---------+
| sname   |
+---------+
| Peel    |
| Serres  |
| AxelRod |
| Motika  |
| Rifkin  |
+---------+
5 rows in set (0.00 sec)






**************************************************************************************************************************************



Que 6 -> List names of all customers matched with the salespeople serving them. 

Query -> SELECT cust.cnum,cname  
      -> FROM Customers cust 
      -> INNER JOIN salespeople sale ON cust.snum=sale.snum;
+------+----------+
| cnum | cname    |
+------+----------+
| 2001 | hoffman  |
| 2002 | Giovanni |
| 2003 | Liu      |
| 2004 | Grass    |
| 2006 | Clemens  |
| 2007 | Pereira  |
| 2008 | Cisneros |
+------+----------+
7 rows in set (0.00 sec)




**************************************************************************************************************************************





Que 7 ->  Find the names and numbers of all salespeople who have more than one customer. 

Query ->   
         -> SELECT S.snum, S.sname, COUNT(C.snum) AS count  
         -> FROM salespeople S   
         -> INNER JOIN Customers C ON S.snum = C.snum GROUP BY C.snum;
+------+---------+-------+
| snum | sname   | count |
+------+---------+-------+
| 1001 | Peel    |     2 |
| 1002 | Serres  |     2 |
| 1003 | AxelRod |     1 |
| 1004 | Motika  |     1 |
| 1007 | Rifkin  |     1 |
+------+---------+-------+
5 rows in set (0.00 sec)




**************************************************************************************************************************************





Que 8 -> Count the orders of each of the salespeople and output the results in descending order.

Query -> SELECT DISTINCT  C.SNUM,S.SNAME,COUNT(*) AS Order_Count 
      -> FROM Orders O,Customers C,salespeople S 
      -> WHERE S.snum=C.snum AND O.cnum=C.cnum GROUP BY snum ORDER BY COUNT(onum) DESC;
+------+---------+-------------+
| SNUM | SNAME   | Order_Count |
+------+---------+-------------+
| 1001 | Peel    |           3 |
| 1002 | Serres  |           3 |
| 1007 | Rifkin  |           2 |
| 1003 | AxelRod |           1 |
| 1004 | Motika  |           1 |
+------+---------+-------------+
5 rows in set (0.00 sec)




**************************************************************************************************************************************




Que 9 -> List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.

Query -> SELECT cnum,cname,city,rating,snum
      -> FROM Customers 
      -> WHERE city = 'SanJose' ;
    
+------+----------+---------+--------+------+
| cnum | cname    | city    | rating | snum |
+------+----------+---------+--------+------+
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2008 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+




**************************************************************************************************************************************





Que 10 -> Match salespeople to customers according to what city they live in.

Query  -> SELECT S.sname,C.cname,S.city 
       -> FROM salespeople S,Customers C 
       -> WHERE S.city=C.city;
+--------+----------+---------+
| sname  | cname    | city    |
+--------+----------+---------+
| Peel   | hoffman  | London  |
| Motika | hoffman  | London  |
| Fran   | hoffman  | London  |
| Serres | Liu      | SanJose |
| Peel   | Clemens  | London  |
| Motika | Clemens  | London  |
| Fran   | Clemens  | London  |
| Serres | Cisneros | SanJose |
+--------+----------+---------+
8 rows in set (0.01 sec)




**************************************************************************************************************************************




Que 11-> Find all the customers in SanJose who have a rating above 200.

Query -> SELECT cnum,cname,city,rating
      -> FROM Customers
      -> WHERE city='SanJose' AND rating > 200;
+------+----------+---------+--------+
| cnum | cname    | city    | rating |
+------+----------+---------+--------+
| 2008 | Cisneros | SanJose |    300 |
+------+----------+---------+--------+
1 row in set (0.00 sec)


**************************************************************************************************************************************



Que 12 -> List the names and commissions of all salespeople in London.

Query  -> SELECT sname,comm 
       -> FROM salespeople 
       -> WHERE city ='London';
+--------+------+
| sname  | comm |
+--------+------+
| Peel   | 12   |
| Motika | 11   |
| Fran   | 25   |
+--------+------+
3 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 13 -> List all the orders of Salesperson Motika from the orders table.

Query  -> SELECT O.onum,amt,odate
       -> FROM Orders O
       -> WHERE O.snum IN (SELECT S.snum
       ->                  FROM salespeople S
       ->                  WHERE S.sname = 'Motika');
+------+--------+------------+
| onum | amt    | odate      |
+------+--------+------------+
| 3002 | 1900.1 | 1990-03-10 |
+------+--------+------------+
1 row in set (0.00 sec)

 
**************************************************************************************************************************************
 
       

Que 14  -> Find all customers who booked orders on October 3.

Query  -> SELECT C.cnum,C.name,C.rating
       -> FROM Customers C
       -> INNER JOIN Orders O ON C.cnum=O.cnum 
       -> WHERE O.odate = '1990-03-10';

+------+----------+--------+
| cnum | cname    | rating |
+------+----------+--------+
| 2008 | Cisneros |    300 |
| 2007 | Pereira  |    100 |
| 2001 | hoffman  |    100 |
| 2003 | Liu      |    200 |
| 2008 | Cisneros |    300 |
+------+----------+--------+
5 rows in set (0.00 sec)


**************************************************************************************************************************************




Que 15  ->  Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at    least 2000 above  the maximum Amount.

Query  ->SELECT odate,SUM(amt) AS total_amt 
       ->FROM Orders  
       ->GROUP BY odate;
+------------+-----------+
| odate      | total_amt |
+------------+-----------+
| 1990-03-10 |   8944.59 |
| 1990-04-10 |   1788.98 |
| 1990-05-10 |      4723 |
| 1990-06-10 |  11201.83 |
+------------+-----------+
4 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 16 -> Select all orders that had amounts that were greater than at least one of the orders from October 6.

Query   -> SELECT onum,amt,odate 
        -> FROM Orders 
        -> WHERE amt > (SELECT MIN(amt)
        ->              FROM Orders
        ->              WHERE odate ='1990-06-10');
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3002 |  1900.1 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3008 |    4723 | 1990-05-10 |
| 3009 | 1713.23 | 1990-04-10 |
| 3011 | 9891.88 | 1990-06-10 |
+------+---------+------------+
5 rows in set (0.00 sec)

**************************************************************************************************************************************



Que 17 ->  Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

Query  ->   SELECT S.snum,S.sname,S.city 
       ->   FROM salespeople S 
       ->   WHERE EXISTS( SELECT C.snum                
                          FROM Customers C               
                          WHERE C.snum=S.snum AND  C.rating = 300
                        );
+------+--------+-----------+
| snum | sname  | city      |
+------+--------+-----------+
| 1002 | Serres | SanJose   |
| 1007 | Rifkin | Barcelona |
+------+--------+-----------+
2 rows in set (0.01 sec)


**************************************************************************************************************************************



Que 18  ->  Find all customers whose cnum is 1000 above the snum of Serres.

Query   -> SELECT C.CNUM,C.CNAME 
        -> FROM Customers C,Salespeople S 
        -> WHERE S.SNUM=C.SNUM and C.CNUM>S.SNUM+1000;
+------+---------+
| CNUM | CNAME   |
+------+---------+
| 2003 | Liu     |
| 2004 | Grass   |
| 2005 | Clemens |
| 2007 | Pereira |
+------+---------+



**************************************************************************************************************************************



Que 19  -> Give the salespeople’s commissions as percentages instead of decimal numbers.

Query   -> SELECT sname,comm*100 AS COMM 
        -> FROM Salespeople.
        
+---------+------+
| SNAME   | COMM |
+---------+------+
| Peel    | 1200 |
| Serres  | 1300 |
| AxelRod | 1000 |
| Motika  | 1100 |
| Rifkin  | 1500 |
| Fran    | 2500 |
+---------+------+
6 rows in set (0.00 sec)
 
**************************************************************************************************************************************
 
 
 
Que 20 -> Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000.

Query  -> SELECT onum,odate,MAX(amt) 
       -> FROM Orders 
       -> GROUP BY onum HAVING MAX(amt)>3000;
+------+------------+----------+
| onum | odate      | MAX(amt) |
+------+------------+----------+
| 3005 | 1990-03-10 |  5160.45 |
| 3008 | 1990-05-10 |     4723 |
| 3011 | 1990-06-10 |  9891.88 |
+------+------------+----------+
3 rows in set (0.00 sec)  




**************************************************************************************************************************************
      


Que 21 ->  List all the largest orders for October 3, for each salesperson.

Query  -> SELECT  MAX(amt) AS total_amount 
       -> FROM Orders O,salespeople S 
       -> WHERE O.snum = S.snum AND odate='1990-03-10';
+--------------+
| total_amount |
+--------------+
|      5160.45 |
+--------------+
1 row in set (0.00 sec)



**************************************************************************************************************************************




Que 22 ->  Find all customers located in cities where Serres has customers.

Query  -> SELECT C.cnum,C.cname,C.city 
       -> FROM Customers C
       -> INNER JOIN salespeople S ON S.snum=C.snum
       -> WHERE S.sname='Serres';
+------+-------+---------+
| cnum | cname | city    |
+------+-------+---------+
| 2003 | Liu   | SanJose |
| 2004 | Grass | Berlin  |
+------+-------+---------+
2 rows in set (0.00 sec)



**************************************************************************************************************************************




Que 23 -> Select all customers with a rating above 200

Query  -> SELECT cnum,cname,city,rating 
       -> FROM Customers 
       -> WHERE rating > 200;
+------+----------+---------+--------+
| cnum | cname    | city    | rating |
+------+----------+---------+--------+
| 2004 | Grass    | Berlin  |    300 |
| 2008 | Cisneros | SanJose |    300 |
+------+----------+---------+--------+
2 rows in set (0.00 sec)





**************************************************************************************************************************************





Que 24 -> Count the number of salespeople currently having orders in the orders table.

Query  ->SELECT S.sname,COUNT(O.snum) AS total_order 
       ->FROM salespeople S INNER JOIN Orders O ON O.snum=S.snum 
       ->GROUP BY S.sname ;
+---------+---------------+
| sname   | total_order   |
+---------+---------------+
| AxelRod |             1 |
| Motika  |             1 |
| Peel    |             3 |
| Rifkin  |             2 |
| Serres  |             3 |
+---------+---------------+
5 rows in set (0.00 sec)





**************************************************************************************************************************************



Que 25 -> Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name,salesperson’s name and the salesperson’s rate of commission.


Query  ->SELECT S.sname,C.cname,S.comm 
       ->FROM salespeople S 
       ->INNER JOIN Customers C ON S.snum=C.snum 
       ->WHERE S.comm > 12;
+--------+----------+------+
| sname  | cname    | comm |
+--------+----------+------+
| Serres | Liu      | 13   |
| Serres | Grass    | 13   |
| Rifkin | Cisneros | 15   |
+--------+----------+------+
3 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 26 -> Find salespeople who have multiple customers.

Query  ->SELECT snum, COUNT(snum) AS total_customers  
       ->FROM Customers  
       ->GROUP BY snum  
       ->HAVING COUNT(snum)>1;
+------+-----------------+
| snum | total_customers |
+------+-----------------+
| 1001 |               2 |
| 1002 |               2 |
+------+-----------------+
2 rows in set (0.00 sec)




**************************************************************************************************************************************




Que 27 ->Find salespeople with customers located in their own cities.

Query  ->SELECT S.snum,S.sname,C.cname,S.city AS city 
       ->FROM salespeople S, Customers C  
       ->WHERE C.city = S.city;
+------+--------+----------+---------+
| snum | sname  | cname    | city    |
+------+--------+----------+---------+
| 1001 | Peel   | hoffman  | London  |
| 1004 | Motika | hoffman  | London  |
| 1008 | Fran   | hoffman  | London  |
| 1002 | Serres | Liu      | SanJose |
| 1001 | Peel   | Clemens  | London  |
| 1004 | Motika | Clemens  | London  |
| 1008 | Fran   | Clemens  | London  |
| 1002 | Serres | Cisneros | SanJose |
+------+--------+----------+---------+
8 rows in set (0.00 sec)




**************************************************************************************************************************************




Que 28 -> Find all salespeople whose name starts with ‘P’ and fourth character is ‘L’.

Query  -> SELECT snum,sname  
       -> FROM salespeople  
       -> WHERE sname LIKE 'P__L';
+------+-------+
| snum | sname |
+------+-------+
| 1001 | Peel  |
+------+-------+
1 row in set (0.00 sec)




**************************************************************************************************************************************




Que 29 -> Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.


Query -> SELECT onum,odate,amt 
      -> FROM Orders 
      -> WHERE Orders.cnum=(SELECT cnum
                            FROM Customers              
                            WHERE cname='Cisneros');
+------+------------+---------+
| onum | odate      | amt     |
+------+------------+---------+
| 3001 | 1990-03-10 |   18.69 |
| 3006 | 1990-03-10 | 1098.16 |
+------+------------+---------+
2 rows in set (0.00 sec)



**************************************************************************************************************************************

Que 30 ->Find the largest orders for Serres and Rifkin.

Query  ->SELECT snum,MAX(amt) AS Total_Amount 
       ->FROM Orders 
       ->GROUP BY snum HAVING snum IN(SELECT snum 
                                      FROM salespeople 
                                      WHERE sname='Serres' OR sname= 'Rifkin');
+------+--------------+
| snum | Total_Amount |
+------+--------------+
| 1002 |      5160.45 |
| 1007 |      1098.16 |
+------+--------------+
2 rows in set (0.00 sec)




**************************************************************************************************************************************





Que 31 -> Sort the salespeople table in the following order: snum, sname, commission, city.

Query  ->SELECT snum,sname,city,comm 
       ->FROM salespeople;
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 12   |
| 1002 | Serres  | SanJose   | 13   |
| 1003 | AxelRod | New York  | 10   |
| 1004 | Motika  | London    | 11   |
| 1007 | Rifkin  | Barcelona | 15   |
| 1008 | Fran    | London    | 25   |
+------+---------+-----------+------+
6 rows in set (0.00 sec)





**************************************************************************************************************************************




Que 32 -> Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range

Query -> SELECT cnum,cname  
      -> FROM Customers  
      -> WHERE cname BETWEEN 'A' AND 'G'
      -> GROUP BY cnum;
+------+----------+
| cnum | cname    |
+------+----------+
| 2006 | Clemens  |
| 2008 | Cisneros |
+------+----------+
2 rows in set (0.00 sec)



**************************************************************************************************************************************




Que 33 -> Select all the possible combinations of customers you can assign.

Query  -> SELECT S.sname,C.cname 
       -> FROM salespeople S 
       -> INNER JOIN Customers C ON S.snum=C.snum;
+---------+----------+
| sname   | cname    |
+---------+----------+
| Peel    | hoffman  |
| AxelRod | Giovanni |
| Serres  | Liu      |
| Serres  | Grass    |
| Peel    | Clemens  |
| Motika  | Pereira  |
| Rifkin  | Cisneros |
+---------+----------+
7 rows in set (0.00 sec)




**************************************************************************************************************************************





Que 34 -> Select all orders that are greater than the average for October 4.

Query  ->SELECT O.onum,O.amt,O.odate
       ->FROM Orders O
       ->WHERE amt>(SELECT AVG(amt)
       ->           FROM Orders
       ->           WHERE odate='1990-04-10');
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3002 |  1900.1 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3006 | 1098.16 | 1990-03-10 |
| 3008 |    4723 | 1990-05-10 |
| 3009 | 1713.23 | 1990-04-10 |
| 3010 | 1309.95 | 1990-06-10 |
| 3011 | 9891.88 | 1990-06-10 |
+------+---------+------------+
7 rows in set (0.00 sec)




**************************************************************************************************************************************



Que 35 -> Write a select command using correlated subquery that selects the names and numbers of all customers with ratings equal to the maximumfor their city.


Query ->SELECT cnum,cname,city,rating 
      ->FROM Customers 
      ->WHERE rating IN(SELECT MAX(rating)                
                        FROM Customers                
                        GROUP BY city);
+------+----------+---------+--------+
| cnum | cname    | city    | rating |
+------+----------+---------+--------+
| 2001 | hoffman  | london  |    100 |
| 2002 | Giovanni | Rome    |    200 |
| 2003 | Liu      | SanJose |    200 |
| 2004 | Grass    | Berlin  |    300 |
| 2006 | Clemens  | London  |    100 |
| 2007 | Pereira  | Rome    |    100 |
| 2008 | Cisneros | SanJose |    300 |
+------+----------+---------+--------+
7 rows in set (0.00 sec)





**************************************************************************************************************************************



Que 36 -> Write a query that totals the orders for each day and places the results in descending order.

Query  -> SELECT SUM(amt) AS total_amt,odate 
       -> FROM Orders 
       -> GROUP BY odate 
       -> ORDER BY odate DESC;
+-----------+------------+
| total_amt | odate      |
+-----------+------------+
|  11201.83 | 1990-06-10 |
|      4723 | 1990-05-10 |
|   1788.98 | 1990-04-10 |
|   8944.59 | 1990-03-10 |
+-----------+------------+
4 rows in set (0.00 sec)
 


**************************************************************************************************************************************

Que 37 -> Write a select command that produces the rating followed by the name of each customer in SanJose.

Query -> SELECT cnum,cname,rating 
      -> FROM Customers 
      -> WHERE city ='SanJose';
+------+----------+--------+
| cnum | cname    | rating |
+------+----------+--------+
| 2003 | Liu      |    200 |
| 2008 | Cisneros |    300 |
+------+----------+--------+
2 rows in set (0.00 sec)


**************************************************************************************************************************************

Que 38 -> Find all orders with above average amounts for their customers.

Query  -> SELECT onum,amt,cnum
       -> FROM Orders 
       -> WHERE amt > (SELECT AVG(amt)
       ->              FROM Orders);
+------+---------+------+
| onum | amt     | cnum |
+------+---------+------+
| 3005 | 5160.45 | 2003 |
| 3008 |    4723 | 2006 |
| 3011 | 9891.88 | 2006 |
+------+---------+------+
3 rows in set (0.00 sec)



**************************************************************************************************************************************

Que 39 ->Find all orders with amounts smaller than any amount for a customer in SanJose. 

Query  -> SELECT onum,amt,odate,cnum 
       -> FROM Orders  
       -> WHERE amt < (SELECT amt              
                       FROM Orders             
                       WHERE cnum = (SELECT cnum                         
                       FROM Customers
                       WHERE city ='SanJose' AND cname='Liu'));
+------+---------+------------+------+
| onum | amt     | odate      | cnum |
+------+---------+------------+------+
| 3001 |   18.69 | 1990-03-10 | 2008 |
| 3002 |  1900.1 | 1990-03-10 | 2007 |
| 3003 |  767.19 | 1990-03-10 | 2001 |
| 3006 | 1098.16 | 1990-03-10 | 2008 |
| 3007 |   75.75 | 1990-04-10 | 2004 |
| 3008 |    4723 | 1990-05-10 | 2006 |
| 3009 | 1713.23 | 1990-04-10 | 2002 |
| 3010 | 1309.95 | 1990-06-10 | 2004 |
+------+---------+------------+------+
8 rows in set (0.00 sec)



**************************************************************************************************************************************




Que 40 -> Write a query that selects the highest rating in each city.

Query  -> SELECT city,MAX(rating) AS Max_rating 
       -> FROM Customers 
       -> GROUP BY city;
+---------+------------+
| city    | Max_rating |
+---------+------------+
| Berlin  |        300 |
| london  |        100 |
| Rome    |        200 |
| SanJose |        300 |
+---------+------------+
4 rows in set (0.00 sec)




**************************************************************************************************************************************




Que 41 ->Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.

Query  ->SELECT S.snum,S.sname,S.comm*O.amt AS total_amt 
       ->FROM salespeople S 
       ->INNER JOIN Customers C ON C.snum=S.snum 
       ->INNER JOIN Orders O ON C.cnum=O.cnum  
       ->WHERE C.rating > 100;
+------+---------+--------------------+
| snum | sname   | total_amt          |
+------+---------+--------------------+
| 1003 | AxelRod |            17132.3 |
| 1002 | Serres  |  67085.84999999999 |
| 1002 | Serres  |             984.75 |
| 1002 | Serres  | 17029.350000000002 |
| 1007 | Rifkin  |             280.35 |
| 1007 | Rifkin  |            16472.4 |
+------+---------+--------------------+
6 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 42 -> Count the customers with ratings above SanJose’s average.

Query  ->SELECT COUNT(city) AS total_count 
       ->FROM Customers 
       ->WHERE rating > (SELECT AVG(rating)                 
                         FROM Customers                 
                         WHERE city='SanJose');
+-------------+
| total_count |
+-------------+
|           2 |
+-------------+
1 row in set (0.00 sec)



**************************************************************************************************************************************

Que 43 ->Find all salespeople that are located in either Barcelona or London

Query  ->SELECT snum,sname,city
       ->FROM salespeople
       ->WHERE city='Barcelona' OR city='London';
+------+--------+-----------+
| snum | sname  | city      |
+------+--------+-----------+
| 1001 | Peel   | London    |
| 1004 | Motika | London    |
| 1007 | Rifkin | Barcelona |
| 1008 | Fran   | London    |
+------+--------+-----------+
4 rows in set (0.00 sec)


**************************************************************************************************************************************


Que 44 ->Find all salespeople with only one customer

Query  ->SELECT snum
       -> FROM Customers
       -> GROUP BY snum
       -> HAVING COUNT(snum)<=1;
+------+
| snum |
+------+
| 1003 |
| 1004 |
| 1007 |
+------+
3 rows in set (0.00 sec)



**************************************************************************************************************************************




Que 45 ->Write a query that joins the Customer table to itself to find all pairs or customers served by a single salesperson.

Query  ->SELECT C1.cname AS Cname1,C2.cname AS Cname2,S.sname  
       ->FROM Customers C1 
       ->JOIN Customers C2 
           ON C1.cnum=C2.cnum 
       ->JOIN salespeople S 
           ON S.snum=C1.snum;
+----------+----------+---------+
| Cname1   | Cname2   | sname   |
+----------+----------+---------+
| hoffman  | hoffman  | Peel    |
| Giovanni | Giovanni | AxelRod |
| Liu      | Liu      | Serres  |
| Grass    | Grass    | Serres  |
| Clemens  | Clemens  | Peel    |
| Pereira  | Pereira  | Motika  |
| Cisneros | Cisneros | Rifkin  |
+----------+----------+---------+
7 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 46 -> Write a query that will give you all orders for more than $1000.00.


Query  ->SELECT onum,amt,odate
       ->FROM Orders
       ->WHERE amt > 1000;
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3002 |  1900.1 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3006 | 1098.16 | 1990-03-10 |
| 3008 |    4723 | 1990-05-10 |
| 3009 | 1713.23 | 1990-04-10 |
| 3010 | 1309.95 | 1990-06-10 |
| 3011 | 9891.88 | 1990-06-10 |
+------+---------+------------+
7 rows in set (0.00 sec)




**************************************************************************************************************************************


Que 47 ->Write a query that lists each order number followed by the name of the customer who made that order.


Query  ->SELECT O.onum,O.amt,C.cname
       -> FROM Orders O
       -> JOIN Customers C
       ->   ON C.cnum=O.cnum;
+------+---------+----------+
| onum | amt     | cname    |
+------+---------+----------+
| 3003 |  767.19 | hoffman  |
| 3009 | 1713.23 | Giovanni |
| 3005 | 5160.45 | Liu      |
| 3007 |   75.75 | Grass    |
| 3010 | 1309.95 | Grass    |
| 3008 |    4723 | Clemens  |
| 3011 | 9891.88 | Clemens  |
| 3002 |  1900.1 | Pereira  |
| 3001 |   18.69 | Cisneros |
| 3006 | 1098.16 | Cisneros |
+------+---------+----------+
10 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 48 ->Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of ‘Serres’

Query  ->SELECT C.cnum,C.cname,C.city      
       ->FROM Customers C      
       ->JOIN salespeople S
       -> ON C.snum=S.snum      
       ->WHERE C.rating >= Any(SELECT rating      
                               FROM Customers                            
                               WHERE snum=(SELECT snum
                                           FROM salespeople                                         
                                           WHERE sname='Serres'));
+------+----------+---------+
| cnum | cname    | city    |
+------+----------+---------+
| 2002 | Giovanni | Rome    |
| 2003 | Liu      | SanJose |
| 2004 | Grass    | Berlin  |
| 2008 | Cisneros | SanJose |
+------+----------+---------+
4 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 49 -> Write two queries that will produce all orders taken on October 3 or October 4.

Query  -> SELECT onum,amt,odate
       -> FROM Orders
       -> WHERE odate='1990-03-10' OR odate='1990-04-10';
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3001 |   18.69 | 1990-03-10 |
| 3002 |  1900.1 | 1990-03-10 |
| 3003 |  767.19 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3006 | 1098.16 | 1990-03-10 |
| 3007 |   75.75 | 1990-04-10 |
| 3009 | 1713.23 | 1990-04-10 |
+------+---------+------------+
7 rows in set (0.00 sec)





**************************************************************************************************************************************

Que 50 ->Find only those customers whose ratings are higher than every customer in Rome.

Query  ->SELECT cnum,cname,city,rating 
       ->FROM Customers 
       ->WHERE rating > (SELECT MAX(rating)                    
                         FROM Customers                    
                         WHERE city='Rome');


+------+----------+---------+--------+
| cnum | cname    | city    | rating |
+------+----------+---------+--------+
| 2004 | Grass    | Berlin  |    300 |
| 2008 | Cisneros | SanJose |    300 |
+------+----------+---------+--------+
2 rows in set (0.00 sec)



**************************************************************************************************************************************




Que 51 ->Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome.

Query  -> SELECT cnum,city,rating 
       -> FROM Customers 
       -> WHERE (rating <= 100 AND city ='Rome') OR rating >=100;
+------+---------+--------+
| cnum | city    | rating |
+------+---------+--------+
| 2001 | london  |    100 |
| 2002 | Rome    |    200 |
| 2003 | SanJose |    200 |
| 2004 | Berlin  |    300 |
| 2006 | London  |    100 |
| 2007 | Rome    |    100 |
| 2008 | SanJose |    300 |
+------+---------+--------+
7 rows in set (0.00 sec)




**************************************************************************************************************************************




Que 52 ->Find all rows from the customer’s table for which the salesperson number is 1001.


Query  ->SELECT cnum,cname,city
       -> FROM Customers 
       -> WHERE snum=1001;

+------+---------+--------+
| cnum | cname   | city   |
+------+---------+--------+
| 2001 | hoffman | london |
| 2006 | Clemens | London |
+------+---------+--------+
2 rows in set (0.00 sec)




**************************************************************************************************************************************


Que 53 ->Find the total amount in orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table

Query  ->







**************************************************************************************************************************************


Que 54 ->Write a query that selects all orders save those with zeroes or NULL in the amount file.


Query  ->SELECT onum,amt,odate
       -> FROM Orders
       -> WHERE amt IS NULL OR amt=0;

Empty set (0.00 sec)



**************************************************************************************************************************************


Que 55 -> Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.


Query  ->SELECT C.cnum,C.cname,S.snum,S.sname,C.rating 
       ->FROM Customers C 
       ->JOIN salespeople S  
          ON S.snum=C.snum 
       ->WHERE C.rating<200 
       ->ORDER BY C.cname;
+------+---------+------+--------+--------+
| cnum | cname   | snum | sname  | rating |
+------+---------+------+--------+--------+
| 2006 | Clemens | 1001 | Peel   |    100 |
| 2001 | hoffman | 1001 | Peel   |    100 |
| 2007 | Pereira | 1004 | Motika |    100 |
+------+---------+------+--------+--------+

3 rows in set (0.00 sec)



**************************************************************************************************************************************


Que 56 ->Find all salespeople name and commission.

Query  -> SELECT sname,comm
       -> FROM salespeople;


+---------+------+
| sname   | comm |
+---------+------+
| Peel    | 12   |
| Serres  | 13   |
| AxelRod | 10   |
| Motika  | 11   |
| Rifkin  | 15   |
| Fran    | 25   |
+---------+------+
6 rows in set (0.00 sec)







**************************************************************************************************************************************


Que 57 -> Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum rather than his rating, so that it would still be usable if his rating is changed.

Query  ->SELECT cnum,cname,city,rating
       -> FROM Customers
       -> WHERE rating = (SELECT rating 
       ->                 FROM Customers
       ->                 WHERE cname='Hoffman');
+------+---------+--------+--------+
| cnum | cname   | city   | rating |
+------+---------+--------+--------+
| 2001 | hoffman | london |    100 |
| 2006 | Clemens | London |    100 |
| 2007 | Pereira | Rome   |    100 |
+------+---------+--------+--------+
3 rows in set (0.01 sec)



**************************************************************************************************************************************


Que 58 ->Find all salespeople for whom there are customers that follow them in alphabetical order.

Query  ->SELECT s.snum,s.sname,s.city,s.comm 
       ->FROM salespeople s 
       ->WHERE  EXISTS(SELECT c.cnum,c.cname 
                       FROM Customers c 
                       WHERE s.sname  < c.cname);


+------+---------+----------+------+
| snum | sname   | city     | comm |
+------+---------+----------+------+
| 1001 | Peel    | London   | 12   |
| 1003 | AxelRod | New York | 10   |
| 1004 | Motika  | London   | 11   |
| 1008 | Fran    | London   | 25   |
+------+---------+----------+------+
4 rows in set (0.00 sec)



**************************************************************************************************************************************


Que 59 -> Write a query that produces the names and ratings of all customers who have average orders.


Query  ->SELECT cnum,cname,rating 
       ->FROM Customers  
       ->WHERE rating > (SELECT AVG(rating)
                         FROM Customers);


+------+----------+--------+
| cnum | cname    | rating |
+------+----------+--------+
| 2002 | Giovanni |    200 |
| 2003 | Liu      |    200 |
| 2004 | Grass    |    300 |
| 2008 | Cisneros |    300 |
+------+----------+--------+
4 rows in set (0.00 sec)



**************************************************************************************************************************************



Que 60 ->Find the SUM of all Amounts from the orders table


Query  ->SELECT SUM(amt) AS total_amt
       -> FROM Orders;
    
+-----------+
| total_amt |
+-----------+
|   26658.4 |
+-----------+
1 row in set (0.00 sec)



***********************************************************************************************************************************



Que 61->Write a SELECT command that produces the order number, amount, and the date from rows in the order table.

Query ->SELECT onum,amt,odate
      ->FROM Orders;
    
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3001 |   18.69 | 1990-03-10 |
| 3002 |  1900.1 | 1990-03-10 |
| 3003 |  767.19 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3006 | 1098.16 | 1990-03-10 |
| 3007 |   75.75 | 1990-04-10 |
| 3008 |    4723 | 1990-05-10 |
| 3009 | 1713.23 | 1990-04-10 |
| 3010 | 1309.95 | 1990-06-10 |
| 3011 | 9891.88 | 1990-06-10 |
+------+---------+------------+
10 rows in set (0.00 sec)


***********************************************************************************************************************************

Que 62-> Count the number of non NULL rating fields in the Customers table (including repeats).

Query ->SELECT COUNT(rating) AS count_rating  
      ->FROM Customers 
      ->WHERE rating NOT IN (rating=0);
+--------------+
| count_rating |
+--------------+
|            7 |
+--------------+
1 row in set (0.00 sec)





***********************************************************************************************************************************


Que 63->Write a query that gives the names of both the salesperson and the customer for each order after the order number

Query ->SELECT O.onum ,S.sname ,C.cname  
      ->FROM Orders O 
      ->JOIN salespeople S   
         ON O.snum=S.snum 
      ->JOIN Customers C   
         ON O.cnum=C.cnum;
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3001 | Rifkin  | Cisneros |
| 3002 | Motika  | Pereira  |
| 3003 | Peel    | hoffman  |
| 3005 | Serres  | Liu      |
| 3006 | Rifkin  | Cisneros |
| 3007 | Serres  | Grass    |
| 3008 | Peel    | Clemens  |
| 3009 | AxelRod | Giovanni |
| 3010 | Serres  | Grass    |
| 3011 | Peel    | Clemens  |
+------+---------+----------+
10 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 64->List the commissions of all salespeople servicing customers in London.


Query ->SELECT DISTINCT S.sname,S.city,S.comm 
      ->FROM salespeople S 
      ->JOIN Customers C  
         ON C.snum=S.snum 
      ->WHERE C.city = 'London';
+-------+--------+------+
| sname | city   | comm |
+-------+--------+------+
| Peel  | London | 12   |
+-------+--------+------+
1 row in set (0.01 sec)


***********************************************************************************************************************************




Que 65-> Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

Query ->SELECT snum,sname
      ->FROM salespeople 
      ->WHERE snum = ANY(SELECT S.snum
      ->                 FROM salespeople S
      ->                 JOIN Customers C
      ->                  ON S.snum=C.snum
      ->                 WHERE S.city != C.city);


+------+---------+
| snum | sname   |
+------+---------+
| 1003 | AxelRod |
| 1002 | Serres  |
| 1004 | Motika  |
| 1007 | Rifkin  |
+------+---------+
4 rows in set (0.01 sec)





***********************************************************************************************************************************


Que 66->Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them

Query->SELECT S.sname,S.city
    -> FROM salespeople S
    -> WHERE EXISTS(SELECT C.snum 
    ->              FROM Customers C
    ->              WHERE C.city=S.city AND C.snum != S.snum);
+--------+---------+
| sname  | city    |
+--------+---------+
| Serres | SanJose |
| Motika | London  |
| Fran   | London  |
+--------+---------+
3 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 67->Write a query that selects all customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)

Query ->SELECT cnum,cname,city
      ->FROM Customers 
      ->WHERE snum = ANY(SELECT snum
      ->                 FROM salespeople 
      ->                 WHERE sname = 'Peel' OR sname ='Motika';

+------+---------+--------+
| cnum | cname   | city   |
+------+---------+--------+
| 2001 | hoffman | london |
| 2006 | Clemens | London |
| 2007 | Pereira | Rome   |
+------+---------+--------+
3 rows in set (0.00 sec)





***********************************************************************************************************************************


Que 68->Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.)

Query ->SELECT  odate, COUNT(DISTINCT snum) AS Count 
      ->FROM Orders  
      ->GROUP BY odate;

+------------+-------+
| odate      | Count |
+------------+-------+
| 1990-03-10 |     4 |
| 1990-04-10 |     2 |
| 1990-05-10 |     1 |
| 1990-06-10 |     2 |
+------------+-------+
4 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 69->Find all orders attributed to salespeople who live in London.

Query ->SELECT O.onum,O.amt,O.odate,O.snum
    -> FROM Orders O
    -> JOIN salespeople S
    -> ON O.snum=S.snum
    -> WHERE S.city='London';
    
+------+---------+------------+------+
| onum | amt     | odate      | snum |
+------+---------+------------+------+
| 3003 |  767.19 | 1990-03-10 | 1001 |
| 3008 |    4723 | 1990-05-10 | 1001 |
| 3011 | 9891.88 | 1990-06-10 | 1001 |
| 3002 |  1900.1 | 1990-03-10 | 1004 |
+------+---------+------------+------+
4 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 70-> Find all orders by customers not located in the same cities as their salespeople.

Query ->SELECT C.cnum,C.cname,C.city 
      ->FROM Customers C 
      ->WHERE C.snum  = ANY(SELECT S.snum                
                            FROM salespeople S               
                            WHERE C.city != S.city);

+------+----------+---------+
| cnum | cname    | city    |
+------+----------+---------+
| 2002 | Giovanni | Rome    |
| 2004 | Grass    | Berlin  |
| 2007 | Pereira  | Rome    |
| 2008 | Cisneros | SanJose |
+------+----------+---------+
4 rows in set (0.00 sec)



***********************************************************************************************************************************


Que 71->Find all salespeople who have customers with more than one current order.

Query ->SELECT DISTINCT snum 
      ->FROM Orders 
      ->WHERE cnum IN(SELECT cnum
                      FROM Orders               
                      GROUP BY cnum               
                      HAVING COUNT(cnum) > 1);
+------+
| snum |
+------+
| 1001 |
| 1002 |
| 1007 |
+------+
3 rows in set (0.00 sec)


***********************************************************************************************************************************


Que 72-> Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another customer(besides the customer being selected) with orders in the Orders Table.

Query ->SELECT C.cnum,C.cname 
      ->FROM Customers C 
      ->WHERE C.snum = ANY(SELECT O.snum
                           FROM Orders O                    
                           GROUP BY snum
                           HAVING COUNT(snum)>1);
+------+----------+
| cnum | cname    |
+------+----------+
| 2001 | hoffman  |
| 2003 | Liu      |
| 2004 | Grass    |
| 2006 | Clemens  |
| 2008 | Cisneros |
+------+----------+
5 rows in set (0.00 sec)



***********************************************************************************************************************************



Que 73->Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest rating is (rating).

Query ->SELECT city AS the_city, MAX(rating) AS the_highest_rating 
      ->FROM Customers       
      ->GROUP BY city;


+----------+--------------------+
| the_city | the_highest_rating |
+----------+--------------------+
| Berlin   |                300 |
| london   |                100 |
| Rome     |                200 |
| SanJose  |                300 |
+----------+--------------------+
4 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 74->Write a query that will produce the snum values of all salespeople with orders, having amt greater than 1000 in the Orders Table(without repeats).

Query -> SELECT snum,sname
      -> FROM salespeople
      -> WHERE snum = ANY(SELECT DISTINCT snum
      ->                  FROM Orders 
      ->                  WHERE amt > 1000);
+------+---------+
| snum | sname   |
+------+---------+
| 1004 | Motika  |
| 1002 | Serres  |
| 1007 | Rifkin  |
| 1001 | Peel    |
| 1003 | AxelRod |
+------+---------+
5 rows in set (0.00 sec)


***********************************************************************************************************************************


Que 75->Write a query that lists customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.

Query -> SELECT rating,cname,cnum
      -> FROM Customers 
      -> ORDER BY rating DESC;
+--------+----------+------+
| rating | cname    | cnum |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2008 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | hoffman  | 2001 |
|    100 | Clemens  | 2006 |
|    100 | Pereira  | 2007 |
+--------+----------+------+
7 rows in set (0.00 sec)



***********************************************************************************************************************************


Que 76->Find the average commission for salespeople in London

Query ->SELECT AVG(comm) AS Average_comm
      -> FROM salespeople 
      -> WHERE city ='London';
+--------------+
| Average_comm |
+--------------+
|           16 |
+--------------+
1 row in set (0.00 sec)




***********************************************************************************************************************************


Que 77->Find all orders credited to the same salesperson who services Hoffman.(cnum 2001).

Query -> SELECT onum,amt
      -> FROM Orders 
      -> WHERE snum = (SELECT snum
      ->               FROM Customers 
      ->               WHERE cnum=2001);
+------+---------+
| onum | amt     |
+------+---------+
| 3003 |  767.19 |
| 3008 |    4723 |
| 3011 | 9891.88 |
+------+---------+
3 rows in set (0.00 sec)




***********************************************************************************************************************************


Que 78-> Find all salespeople whose commission is in between 0.10 and 0.12(both inclusive).

Query ->SELECT snum,sname,comm
      ->FROM salespeople
      ->WHERE comm BETWEEN 10 AND 12;


+------+---------+------+
| snum | sname   | comm |
+------+---------+------+
| 1001 | Peel    | 12   |
| 1003 | AxelRod | 10   |
| 1004 | Motika  | 11   |
+------+---------+------+
3 rows in set (0.00 sec)



***********************************************************************************************************************************


Que 79->Write a query that will give you the names and cities of all salespeople in London with a commission above 0.10.

Query ->SELECT sname,city
      ->FROM salespeople
      ->WHERE city='London' AND comm > 10;
+--------+--------+
| sname  | city   |
+--------+--------+
| Peel   | London |
| Motika | London |
| Fran   | London |
+--------+--------+
3 rows in set (0.01 sec)





***********************************************************************************************************************************


Que 80->Write a query that selects each customer’s smallest order

Query -> SELECT cnum,MIN(amt) AS min_order 
      -> FROM Orders 
      -> GROUP BY cnum;


+------+-----------+
| cnum | min_order |
+------+-----------+
| 2001 |    767.19 |
| 2002 |   1713.23 |
| 2003 |   5160.45 |
| 2004 |     75.75 |
| 2006 |      4723 |
| 2007 |    1900.1 |
| 2008 |     18.69 |
+------+-----------+
7 rows in set (0.00 sec)





***********************************************************************************************************************************









