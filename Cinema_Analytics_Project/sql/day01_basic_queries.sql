-- Tickets sold per show
SELECT show_id, COUNT(*) AS tickets_sold
FROM tickets
GROUP BY show_id;

-- Revenue per show
SELECT
    s.show_id,
    m.title,
    COUNT(t.ticket_id) * s.price AS revenue
FROM shows s
JOIN movies m ON s.movie_id = m.movie_id
LEFT JOIN tickets t ON s.show_id = t.show_id
GROUP BY s.show_id, m.title, s.price;
