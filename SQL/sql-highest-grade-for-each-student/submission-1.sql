-- Write your query below
WITH cte AS (
SELECT student_id, exam_id, score, ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id) AS rnk
FROM exam_results
)
SELECT student_id, exam_id, score
FROM cte
WHERE rnk = 1
