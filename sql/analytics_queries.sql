-- Revenue and tickets sold per movie
SELECT
    m.title,
    COUNT(t.ticket_id) AS tickets_sold,
    COUNT(t.ticket_id) * s.price AS revenue
FROM movies m
JOIN shows s ON m.movie_id = s.movie_id
LEFT JOIN tickets t ON s.show_id = t.show_id
GROUP BY m.title, s.price
ORDER BY revenue DESC;

-- Hall occupancy rate
SELECT
    h.hall_name,
    COUNT(t.ticket_id) AS tickets_sold,
    h.capacity,
    ROUND((COUNT(t.ticket_id) / h.capacity) * 100, 2) AS occupancy_percent
FROM halls h
JOIN shows s ON h.hall_id = s.hall_id
LEFT JOIN tickets t ON s.show_id = t.show_id
GROUP BY h.hall_name, h.capacity;

-- Ticket sales by hour
SELECT
    HOUR(s.show_time) AS show_hour,
    COUNT(t.ticket_id) AS tickets_sold
FROM shows s
LEFT JOIN tickets t ON s.show_id = t.show_id
GROUP BY show_hour
ORDER BY tickets_sold DESC;

-- Dataset for Power BI dashboard
SELECT
    s.show_id,
    m.title,
    h.hall_name,
    s.show_time,
    s.price,
    COUNT(t.ticket_id) AS tickets_sold,
    COUNT(t.ticket_id) * s.price AS revenue
FROM shows s
JOIN movies m ON s.movie_id = m.movie_id
JOIN halls h ON s.hall_id = h.hall_id
LEFT JOIN tickets t ON s.show_id = t.show_id
GROUP BY s.show_id, m.title, h.hall_name, s.show_time, s.price;
