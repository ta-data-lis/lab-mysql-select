/* first query on average rating per year*/
SELECT   schools.school,comments.school_id, CASE WHEN comments.graduatingYear IS NULL THEN  year(comments.queryDate) ELSE comments.graduatingYear END as graduating_year, avg(comments.overallScore) as review_average
FROM sql_project.comments
INNER JOIN sql_project.schools ON schools.school_id = comments.school_id
GROUP BY graduating_year, comments.school_id
order by school_id	asc, graduating_year asc ;


/* same as above but with courses name*/
SELECT   schools.school,comments.school_id,courses.courses, CASE WHEN comments.graduatingYear IS NULL THEN  year(comments.queryDate) ELSE comments.graduatingYear END as graduating_year, avg(comments.overallScore) as review_average
FROM sql_project.comments
INNER JOIN sql_project.schools ON schools.school_id = comments.school_id
INNER JOIN sql_project.courses ON courses.school_id = comments.school_id
GROUP BY graduating_year, comments.school_id
order by school_id	asc, graduating_year asc ;

/*trend on locations */
SELECT   schools.school,comments.school_id,courses.courses, CASE WHEN comments.graduatingYear IS NULL THEN  year(comments.queryDate) ELSE comments.graduatingYear END as graduating_year, avg(comments.overallScore) as review_average
FROM sql_project.comments
INNER JOIN sql_project.schools ON schools.school_id = comments.school_id
INNER JOIN sql_project.courses ON courses.school_id = comments.school_id
GROUP BY graduating_year, comments.school_id
order by school_id	asc, graduating_year asc ;


SELECT comments.school_id, comments.overallScore, comments.review_body FROM sql_project.comments /*CASE WHEN comments.graduatingYear IS NULL THEN year(comments.queryDate) else comments.graduatingYear END AS graduating_year*/
WHERE comments.review_body like '%online%' and comments.overallScore <4.3


ORDER BY comments.overallScore ASC;

select courses.courses, comments.jobTitle from sql_project.comments
INNER JOIN sql_project.courses ON courses.school_id = comments.school_id
WHERE comments.JobTitle is NOT NULL and comments.jobTitle is NOT NULL
GROUP BY courses.courses

SELECT C.school_id, C.courses, CT.type
FROM courses C
INNER JOIN ctype CT ON CT.type_id = C.ctype;