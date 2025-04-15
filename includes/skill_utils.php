<?php
/**
 * Updates user skill scores based on test performance
 * Place this function in a utility file and include it where tests are processed
 *
 * @param int $user_id The user ID
 * @param int $test_id The test ID that was completed
 * @param array $question_results Array of question results with format [question_id => [is_correct => bool, time_taken => int]]
 * @param object $conn Database connection object
 * @return bool True if successful, false otherwise
 */
function updateUserSkills($user_id, $test_id, $question_results, $conn) {
    try {
        // Get the skills assessed by this test
        $sql = "SELECT 
                    qs.skill_id, 
                    sc.skill_name,
                    SUM(qs.weight) as total_weight,
                    COUNT(DISTINCT q.question_id) as question_count
                FROM 
                    questions q
                JOIN 
                    question_skills qs ON q.question_id = qs.question_id
                JOIN 
                    skill_categories sc ON qs.skill_id = sc.skill_id
                WHERE 
                    q.test_type_id = ? AND q.question_id IN (" . 
                    implode(',', array_keys($question_results)) . ")
                GROUP BY 
                    qs.skill_id, sc.skill_name";
                    
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $test_id);
        $stmt->execute();
        $skills_result = $stmt->get_result();
        
        if ($skills_result->num_rows == 0) {
            // No skills associated with this test
            return false;
        }
        
        // Calculate score for each skill
        $skill_scores = [];
        while ($skill = $skills_result->fetch_assoc()) {
            $skill_id = $skill['skill_id'];
            $correct_count = 0;
            $total_weight = 0;
            
            // Find questions that test this skill
            $sql = "SELECT 
                        q.question_id, 
                        qs.weight
                    FROM 
                        questions q
                    JOIN 
                        question_skills qs ON q.question_id = qs.question_id
                    WHERE 
                        q.test_type_id = ? AND qs.skill_id = ? AND
                        q.question_id IN (" . implode(',', array_keys($question_results)) . ")";
                        
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $test_id, $skill_id);
            $stmt->execute();
            $questions_result = $stmt->get_result();
            
            while ($question = $questions_result->fetch_assoc()) {
                $question_id = $question['question_id'];
                $weight = $question['weight'];
                
                if (isset($question_results[$question_id]) && $question_results[$question_id]['is_correct']) {
                    $correct_count += $weight;
                }
                
                $total_weight += $weight;
            }
            
            // Calculate percentage score
            $score = ($total_weight > 0) ? round(($correct_count / $total_weight) * 100) : 0;
            $skill_scores[$skill_id] = $score;
        }
        
        // Get current skill scores
        $sql = "SELECT skill_id, score FROM user_skills WHERE user_id = ? ORDER BY assessment_date DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $current_skills = $stmt->get_result();
        
        $existing_skills = [];
        while ($row = $current_skills->fetch_assoc()) {
            $existing_skills[$row['skill_id']] = $row['score'];
        }
        
        // Begin transaction
        $conn->begin_transaction();
        
        // Insert or update skill scores
        foreach ($skill_scores as $skill_id => $score) {
            // If skill exists, calculate weighted average (70% previous, 30% new)
            if (isset($existing_skills[$skill_id])) {
                $weighted_score = round($existing_skills[$skill_id] * 0.7 + $score * 0.3);
            } else {
                $weighted_score = $score;
            }
            
            // Insert new skill score record
            $sql = "INSERT INTO user_skills (user_id, skill_id, score, assessment_date) VALUES (?, ?, ?, NOW())";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iii", $user_id, $skill_id, $weighted_score);
            $stmt->execute();
        }
        
        // Commit transaction
        $conn->commit();
        return true;
        
    } catch (Exception $e) {
        // Rollback transaction on error
        if ($conn->inTransaction()) {
            $conn->rollback();
        }
        error_log("Error updating user skills: " . $e->getMessage());
        return false;
    }
}

/**
 * Example usage in test processing script:
 * 
 * // After test is completed and scored
 * $question_results = [
 *     1 => ['is_correct' => true, 'time_taken' => 15],
 *     2 => ['is_correct' => false, 'time_taken' => 25],
 *     3 => ['is_correct' => true, 'time_taken' => 10],
 *     // ...more questions
 * ];
 * 
 * $updated = updateUserSkills($user_id, $test_type_id, $question_results, $conn);
 * 
 * if ($updated) {
 *     // Success - redirect to dashboard
 *     header('Location: mydashboard.php?test_complete=1');
 *     exit;
 * }
 */