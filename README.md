# Star Wars Movies

I simply created a database for every theatrical Star Wars film to date, along with their respective directors and producers.



<img src="Natural_Language_Proj_Schema_AA.jpg">



## A Question that Worked:

**Question**: Which producer doesn't have a known birthdate?

**ChatGPT SQL Response**:
```sql

SELECT name
FROM producer
WHERE birth_date IS NULL;

```
**Raw Response**: [('Catherine Winder',)]

**Friendly Response**: Catherine Winder doesn't have a known birthdate.




## A Question that DIDN'T Work:
The zero shot method produced the wrong result. The SQL was incomplete and gave me the answer of none when there is at least one user each that rented equipment and skis either a blue or black.



**Question**: Which Star Wars movie had the lowest IMDB score? 

**ChatGPT SQL Response**:

```sql
"SELECT m.name
FROM movie m
JOIN producer p ON m.producer_id = p.producer_id
WHERE p.name = 'Kathleen Kennedy' AND m.name LIKE '%Star Wars%'
ORDER BY m.imdb_score ASC
LIMIT 1;"

```

**Friendly response**: It looks like there are no records for people who rented equipment and skied double black trails or blue trails. Therefore, the ratio cannot be determined at this time.

## Multi-shot
The sql for the multi-shot approach was much more complex and complete. This is because it had all of the context that was needed to provide the full response and was able to iterative refine its query producing a much more accurate result.

```sql
SELECT
    (SELECT COUNT(DISTINCT user_id)
     FROM ikon_rentals
     WHERE equipment_type IN ('Ski', 'Snowboard')
     AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Double Black'))) AS double_black_rentals,
    (SELECT COUNT(DISTINCT user_id)
     FROM ikon_rentals
     WHERE equipment_type IN ('Ski', 'Snowboard')
     AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue'))) AS blue_rentals,
    CASE
        WHEN (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue'))) = 0
        THEN NULL
        ELSE (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Double Black'))) * 1.0 /
              (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue')))
        END AS ratio;
```

**Question (multi-shot)**: What is the ratio of people who rent equipment and ski double black vs those who ski blue? 

SQL Result is [(2, 2, 1.0)]

**Friendly response**: The ratio of people who rent equipment and ski double black to those who ski blue is 2:2, or 1:1.

Overall, the multi-shot performed much better for this question, providing the correct answer.


## Conclusion
I was surprised at the answers that gpt-4.0 mini was able to produce. It created some pretty complex queries and was able to interpret the reuslting answers in a very human-readable fashion. Even with complex questions it performed well with a single exception. Overall, this was very interesting to produce.
