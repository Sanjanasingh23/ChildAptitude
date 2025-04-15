<?php
// File: api/get_tests.php

// Start session
session_start();

// Include database configuration
require_once '../config/db_config.php';

// Set content type
header('Content-Type: application/json');

// Check if age_range parameter exists
if (!isset($_GET['age_range'])) {
    echo json_encode(['error' => 'Age range parameter is required']);
    exit;
}

// Sanitize input
$ageRange = mysqli_real_escape_string($conn, $_GET['age_range']);

// Get tests for the specified age range
// Join age_categories and test_types tables
$sql = "SELECT tt.type_id, tt.test_name, tt.description, tt.difficulty 
        FROM test_types tt
        JOIN age_categories ac ON tt.category_id = ac.category_id
        WHERE ac.age_range = '$ageRange'
        ORDER BY tt.type_id";

$result = $conn->query($sql);

$tests = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Get question count for this test
        $countSql = "SELECT COUNT(*) as question_count FROM questions WHERE test_type_id = {$row['type_id']}";
        $countResult = $conn->query($countSql);
        $questionCount = 0;
        
        if ($countResult && $countResult->num_rows > 0) {
            $countRow = $countResult->fetch_assoc();
            $questionCount = $countRow['question_count'];
        }
        
        // Estimate duration (assuming 1 minute per question)
        $duration = max(5, $questionCount); // At least 5 minutes
        
        $tests[] = [
            'id' => $row['type_id'],
            'title' => $row['test_name'],
            'description' => $row['description'],
            'duration' => $duration,
            'difficulty' => $row['difficulty'],
            'question_count' => $questionCount
        ];
    }
}

// Return the tests as JSON
echo json_encode($tests);
?>