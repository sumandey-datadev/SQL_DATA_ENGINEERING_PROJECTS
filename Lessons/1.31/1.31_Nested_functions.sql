SELECT [1,2,3];

SELECT UNLIST['sql','python','r'] AS Skill_array;

with Skills AS (
SELECT 'Python' As Skills
UNION ALL
SELECT 'sql'
UNION ALL
SELECT 'r'
) 
SELECT LIST(Skills) as Skill_array
FROM Skills;

with Skills AS (
SELECT 'Python' As Skills
UNION ALL
SELECT 'sql'
UNION ALL
SELECT 'r'
),
Skill_array AS ( 
SELECT ARRAY_AGG(Skills ORDER BY skills) as SkillS
FROM Skills
)
SELECT 
    skills[1] AS first_skill,
    skills[2] AS second_skill,
    skills[3] AS third_skill
FROM Skill_array;

SELECT {skill: 'python',type: 'programming'} AS skill_struct;

WITH skill_struct AS (
    SELECT
    STRUCT_PACK(
            skill := 'python',
            type := 'Programming'
    ) AS s

)
SELECT s.skill,s.type FROM skill_struct;

WITH Skills AS (
SELECT 'Python' As Skills,'Programming' AS types
UNION ALL
SELECT 'sql','query language'
UNION ALL
SELECT 'r','programming'
),
struct_array AS(
    SELECT
    ARRAY_AGG(
        STRUCT_PACK(
            skill := skills,
            type := types
    )
     ORDER BY 
     STRUCT_PACK(
            skill := skills,
            type := types
    )) AS skill_details
    FROM Skills
)
SELECT skill_details[1].skill,
       skill_details[2].type,
       skill_details[3] 
 FROM struct_array;
