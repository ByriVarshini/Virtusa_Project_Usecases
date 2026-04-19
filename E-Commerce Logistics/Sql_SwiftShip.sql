CREATE DATABASE SwiftShipDB;
USE SwiftShipDB;

-- Partners table
CREATE TABLE Partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100)
);

-- Shipments table
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    partner_id INT,
    origin_city VARCHAR(100),
    destination_city VARCHAR(100),
    promised_date DATE,
    actual_delivery_date DATE,
    status VARCHAR(20),
    order_date DATE,
    FOREIGN KEY (partner_id) REFERENCES Partners(partner_id)
);

-- Delivery Logs table
CREATE TABLE DeliveryLogs (
    log_id INT PRIMARY KEY,
    shipment_id INT,
    log_message VARCHAR(255),
    log_time TIMESTAMP,
    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id)
);

INSERT INTO Partners VALUES
(1, 'BlueDart'),
(2, 'Delhivery'),
(3, 'Ecom Express');

INSERT INTO Shipments VALUES
(101, 1, 'Hyderabad', 'Bangalore', '2026-04-01', '2026-04-02', 'Delivered', '2026-03-28'),
(102, 1, 'Hyderabad', 'Chennai', '2026-04-01', '2026-04-01', 'Delivered', '2026-03-29'),
(103, 2, 'Delhi', 'Mumbai', '2026-04-03', '2026-04-06', 'Delivered', '2026-03-30'),
(104, 2, 'Delhi', 'Pune', '2026-04-02', '2026-04-02', 'Returned', '2026-03-31'),
(105, 3, 'Kolkata', 'Bangalore', '2026-04-01', '2026-04-05', 'Delivered', '2026-03-28'),
(106, 3, 'Kolkata', 'Hyderabad', '2026-04-03', '2026-04-03', 'Delivered', '2026-03-30'),
(107, 1, 'Hyderabad', 'Mumbai', '2026-04-02', '2026-04-04', 'Delivered', '2026-03-29'),
(108, 2, 'Delhi', 'Bangalore', '2026-04-01', '2026-04-01', 'Delivered', '2026-03-27');

INSERT INTO DeliveryLogs VALUES
(1, 101, 'Shipment picked up', '2026-03-28 10:00:00'),
(2, 101, 'Out for delivery', '2026-04-02 08:00:00'),
(3, 103, 'Delayed due to weather', '2026-04-05 14:00:00'),
(4, 105, 'Arrived at sorting hub', '2026-04-03 09:00:00');

-- Query1:Find Delayed Shipments
SELECT 
    shipment_id,
    partner_id,
    destination_city,
    promised_date,
    actual_delivery_date
FROM Shipments
WHERE actual_delivery_date > promised_date;

-- Query2:Partner Performance (Delivered vs Returned)
SELECT 
    p.partner_name,
    COUNT(CASE WHEN s.status = 'Delivered' THEN 1 END) AS successful_deliveries,
    COUNT(CASE WHEN s.status = 'Returned' THEN 1 END) AS returned_deliveries,
    COUNT(*) AS total_shipments
FROM Partners p
JOIN Shipments s ON p.partner_id = s.partner_id
GROUP BY p.partner_name;

-- Query3:Success Rate Ranking
SELECT 
    p.partner_name,
    COUNT(CASE WHEN s.status = 'Delivered' THEN 1 END) AS successful,
    COUNT(*) AS total,
    ROUND(
        COUNT(CASE WHEN s.status = 'Delivered' THEN 1 END) * 100.0 / COUNT(*),2
    ) AS success_rate
FROM Partners p
JOIN Shipments s ON p.partner_id = s.partner_id
GROUP BY p.partner_name
ORDER BY success_rate DESC;

-- Query4:Most Popular Destination (Last 30 Days)
SELECT 
    destination_city,
    COUNT(*) AS total_orders
FROM Shipments
WHERE order_date >= CURRENT_DATE - INTERVAL 30 DAY
GROUP BY destination_city
ORDER BY total_orders DESC
LIMIT 1;

-- Query5:Partner Scorecard (Best → Worst)
SELECT 
    p.partner_name,
    COUNT(*) AS total_shipments,
    COUNT(CASE 
        WHEN s.actual_delivery_date <= s.promised_date 
        THEN 1 
    END) AS on_time_deliveries,

    COUNT(CASE 
        WHEN s.actual_delivery_date > s.promised_date 
        THEN 1 
    END) AS delayed_deliveries,
    ROUND(
        COUNT(CASE 
            WHEN s.actual_delivery_date <= s.promised_date 
            THEN 1 
        END) * 100.0 / COUNT(*),
        2
    ) AS on_time_percentage
FROM Partners p
JOIN Shipments s ON p.partner_id = s.partner_id
GROUP BY p.partner_name
ORDER BY on_time_percentage DESC;
