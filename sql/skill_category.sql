-- Create skill_categories table if it doesn't exist
CREATE TABLE IF NOT EXISTS skill_categories (
    skill_id INT NOT NULL AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (skill_id)
);

-- Create question_skills table if it doesn't exist
CREATE TABLE IF NOT EXISTS question_skills (
    id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    skill_id INT NOT NULL,
    weight DECIMAL(3,2) DEFAULT 1.0,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill_categories(skill_id) ON DELETE CASCADE
);

-- Create user_skills table if it doesn't exist
CREATE TABLE IF NOT EXISTS user_skills (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    skill_id INT NOT NULL,
    score INT NOT NULL,
    assessment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill_categories(skill_id) ON DELETE CASCADE
);

-- Insert sample skills data
INSERT INTO skill_categories (skill_id, skill_name, description) 
VALUES 
(1, 'Mathematical Reasoning', 'Ability to understand and apply mathematical concepts to solve problems'),
(2, 'Verbal Comprehension', 'Ability to understand and reason with language-based information'),
(3, 'Spatial Recognition', 'Ability to visualize and manipulate objects in space'),
(4, 'Memory Retention', 'Ability to store and recall information'),
(5, 'Logical Reasoning', 'Ability to apply logical thinking to solve problems'),
(6, 'Pattern Recognition', 'Ability to identify and complete patterns'),
(7, 'Reading Comprehension', 'Ability to understand written text and extract meaning'),
(8, 'Auditory Processing', 'Ability to interpret and process sound-based information'),
(9, 'Visual Processing', 'Ability to interpret and understand visual information'),
(10, 'Focus & Attention', 'Ability to concentrate on tasks for extended periods');

-- Link existing questions to skills (sample data - adjust question_id values based on your actual questions)
-- Note: This assumes you already have questions in your database
INSERT INTO question_skills (question_id, skill_id, weight)
VALUES 
-- Math questions
(1, 1, 0.9), -- Strong Mathematical Reasoning
(1, 5, 0.4), -- Some Logical Reasoning
(2, 1, 0.8), -- Strong Mathematical Reasoning
(2, 6, 0.6), -- Medium Pattern Recognition
(3, 1, 0.7), -- Medium Mathematical Reasoning
(3, 5, 0.8), -- Strong Logical Reasoning

-- Verbal questions
(4, 2, 0.9), -- Strong Verbal Comprehension
(4, 7, 0.6), -- Medium Reading Comprehension
(5, 2, 0.8), -- Strong Verbal Comprehension
(5, 8, 0.5), -- Medium Auditory Processing
(6, 2, 0.7), -- Medium Verbal Comprehension
(6, 7, 0.9), -- Strong Reading Comprehension

-- Spatial questions
(7, 3, 0.9), -- Strong Spatial Recognition
(7, 9, 0.6), -- Medium Visual Processing
(8, 3, 0.8), -- Strong Spatial Recognition
(8, 6, 0.5), -- Medium Pattern Recognition
(9, 3, 0.7), -- Medium Spatial Recognition
(9, 9, 0.8), -- Strong Visual Processing

-- Memory questions
(10, 4, 0.9), -- Strong Memory Retention
(10, 10, 0.4), -- Some Focus & Attention
(11, 4, 0.8), -- Strong Memory Retention
(11, 8, 0.3), -- Some Auditory Processing
(12, 4, 0.7), -- Medium Memory Retention
(12, 9, 0.5); -- Medium Visual Processing

-- Insert sample user skill scores (replace user_id with actual user IDs)
-- For existing users with no skill data
INSERT INTO user_skills (user_id, skill_id, score, assessment_date)
SELECT 
    u.user_id,
    sc.skill_id,
    FLOOR(50 + RAND() * 40) AS score, -- Random scores between 50-90
    CURRENT_TIMESTAMP - INTERVAL FLOOR(RAND() * 30) DAY AS assessment_date -- Random dates in last 30 days
FROM 
    users u
CROSS JOIN 
    skill_categories sc
WHERE 
    NOT EXISTS (
        SELECT 1 FROM user_skills us 
        WHERE us.user_id = u.user_id AND us.skill_id = sc.skill_id
    )
LIMIT 100; -- Limit to prevent too many rows