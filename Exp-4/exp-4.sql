CREATE TABLE student_lab (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INTEGER,
    day_no INTEGER
);

INSERT INTO student_lab (student_name, marks, day_no) VALUES
('Manan', 95, 1),
('Aarav', 78, 3),
('Simran', 62, 5),
('Kunal', 45, 7),
('Neha', -5, 9);

/* IF–ELSE */

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT * FROM student_lab LOOP
        IF r.marks > 0 THEN
            RAISE NOTICE '% has POSITIVE marks (%).', r.student_name, r.marks;
        ELSE
            RAISE NOTICE '% has NON-POSITIVE marks (%).', r.student_name, r.marks;
        END IF;
    END LOOP;
END $$;


/*IF–ELSIF–ELSE*/

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT * FROM student_lab LOOP
        IF r.marks >= 90 THEN
            RAISE NOTICE '% : Grade A', r.student_name;
        ELSIF r.marks >= 75 THEN
            RAISE NOTICE '% : Grade B', r.student_name;
        ELSIF r.marks >= 60 THEN
            RAISE NOTICE '% : Grade C', r.student_name;
        ELSE
            RAISE NOTICE '% : Grade F', r.student_name;
        END IF;
    END LOOP;
END $$;


/*ELSIF LADDER*/

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT * FROM student_lab LOOP
        IF r.marks >= 90 THEN
            RAISE NOTICE '% : EXCELLENT', r.student_name;
        ELSIF r.marks >= 75 THEN
            RAISE NOTICE '% : VERY GOOD', r.student_name;
        ELSIF r.marks >= 60 THEN
            RAISE NOTICE '% : GOOD', r.student_name;
        ELSIF r.marks >= 50 THEN
            RAISE NOTICE '% : AVERAGE', r.student_name;
        ELSE
            RAISE NOTICE '% : POOR', r.student_name;
        END IF;
    END LOOP;
END $$;

/*CASE STATEMENT*/


DO $$
DECLARE
    r RECORD;
    day_name TEXT;
BEGIN
    FOR r IN SELECT * FROM student_lab LOOP
        day_name := CASE r.day_no
            WHEN 1 THEN 'Monday'
            WHEN 2 THEN 'Tuesday'
            WHEN 3 THEN 'Wednesday'
            WHEN 4 THEN 'Thursday'
            WHEN 5 THEN 'Friday'
            WHEN 6 THEN 'Saturday'
            WHEN 7 THEN 'Sunday'
            ELSE 'INVALID DAY'
        END;

        RAISE NOTICE '% : Day % is %', r.student_name, r.day_no, day_name;
    END LOOP;
END $$;







