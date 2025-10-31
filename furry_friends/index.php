<?php
require("../db.php");

$method = $_SERVER['REQUEST_METHOD']; // we use method instead of $_POST, $_GET, etc...


function validateID(){

    global $conn;
     if (empty($_GET["id"])) {
        http_response_code(400);
        exit;
    }

    $id = $_GET["id"];

    if(!is_numeric($id)){
        header('Content-Type: application/json; charset=utf-8');
        http_response_code(400);
        echo json_encode(["message" => "ID is malformed"]);
        exit;
    }

    $id = intval($id, 10);

    $stmt = $conn->prepare("SELECT * FROM furry_friends WHERE id = :id");
    $stmt->bindParam(":id",$id, PDO::PARAM_INT);
    $stmt->execute();
   $results = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if(!is_array($results
    )){
        http_response_code(404);
         echo json_encode([
        "message" => "ID not found !",
        "id" => $id
    ]);
        exit;
    }

    return $id;
}

// FETCH ALL FRIENDS  
if ($method === 'GET' && empty($_GET["id"])) {
    $stmt = $conn->query("SELECT * FROM furry_friends");
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Add hypermedia controls 
    for($i = 0; $i < count($results); $i++){
        $results[$i]["url"] = "http://localhost/man_best_friend/furry_friends?id=" . $results[$i]["id"];
        unset($results[$i]["id"]);
    }

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(["results" => $results]);
}

// GET ONE FRIEND BY ID
if ($method === 'GET' && !empty($_GET["id"])) {
    $id = validateID();

    $sql = "SELECT f.id, f.breed, f.description, f.longevity_in_years, 
                   f.weight_in_kg, f.activity_level, 
                   m.id AS media_id, m.name AS media_name, m.url AS media_url
            FROM furry_friends AS f
            LEFT JOIN furry_friends_media AS m
            ON f.id = m.furry_friend_id
            WHERE f.id = :id";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $id, PDO::PARAM_INT);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$rows) {
        http_response_code(404);
        echo json_encode(["message" => "Not found"]);
        exit;
    }

    $friend = [
        "id" => $rows[0]['id'],
        "breed" => $rows[0]['breed'],
        "description" => $rows[0]['description'],
        "longevity_in_years" => $rows[0]['longevity_in_years'],
        "weight_in_kg" => $rows[0]['weight_in_kg'],
        "activity_level" => $rows[0]['activity_level'],
        "media" => []
    ];

    foreach ($rows as $row) {
        if (!empty($row['media_id'])) {
            $friend['media'][] = [
                "media_id" => $row['media_id'],
                "name" => $row['media_name'],
                "url" => $row['media_url']
            ];
        }
    }

    $friend["links"] = [
        "self" => "http://localhost/man_best_friend/furry_friends?id=" . $friend["id"],
        "all" => "http://localhost/man_best_friend/furry_friends",
        "delete" => "http://localhost/man_best_friend/furry_friends?id=" . $friend["id"]
    ];

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($friend);
    exit;
}

//ADD A FRIEND 
if ($method === 'POST') {
    $body = $_POST;

    if (empty($body['breed']) || empty($body['description'])) {
        http_response_code(400);
        echo json_encode(["message" => "Missing required fields"]);
        exit;
    }

        $sql = "INSERT INTO furry_friends (breed, description, longevity_in_years, weight_in_kg, activity_level)
                VALUES (:breed, :description, :longevity_in_years, :weight_in_kg, :activity_level)";
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':breed', $body['breed']);
        $stmt->bindValue(':description', $body['description']);
        $stmt->bindValue(':longevity_in_years', $body['longevity_in_years'] ?? null);
        $stmt->bindValue(':weight_in_kg', $body['weight_in_kg'] ?? null);
        $stmt->bindValue(':activity_level', $body['activity_level'] ?? null);
        $stmt->execute();

        $id = $conn->lastInsertId();
        http_response_code(201);
        echo json_encode([
            "message" => "Created",
            "id" => $id
        ]);
}

// //UPDATE A FRIEND
if ($method === "PUT") {
    $id = validateID();

    parse_str(file_get_contents("php://input"), $body);

    if (empty($body["breed"]) || empty($body["description"])) {
        header("Content-Type: application/json; charset=utf-8");
        http_response_code(400);
        echo json_encode([
            "message" => "Missing field(s). Required fields: 'breed', 'description'"
        ]);
        exit;
    }

    $sql = "UPDATE furry_friends
        SET breed = :breed,
            description = :description,
            longevity_in_years = :longevity_in_years,
            weight_in_kg = :weight_in_kg,
            activity_level = :activity_level
        WHERE id = :id
    ";

    $stmt = $conn->prepare($sql);

    $stmt->bindValue(':breed', $body['breed']);
    $stmt->bindValue(':description', $body['description']);

    $stmt->bindValue(':longevity_in_years', $body['longevity_in_years'] ?? null, PDO::PARAM_INT);
    $stmt->bindValue(':weight_in_kg', $body['weight_in_kg'] ?? null, PDO::PARAM_INT);
    $stmt->bindValue(':activity_level', $body['activity_level'] ?? null);

    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $stmt = $conn->prepare("SELECT * FROM furry_friends WHERE id = :id");
    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    header("Content-Type: application/json; charset=utf-8");
    http_response_code(200);
    echo json_encode($stmt->fetch(PDO::FETCH_ASSOC));
}


// DELETE FRIEND
if ($method === 'DELETE') {
    $id = validateID(); // this checks everything and exits if invalid

    $stmt = $conn->prepare("DELETE FROM furry_friends WHERE id = :id");
    $stmt->bindParam(":id", $id, PDO::PARAM_INT);
    $stmt->execute();

    http_response_code(200);
    echo json_encode([
        "message" => "Friend deleted successfully",
        "id" => $id
    ]);
    exit;
}



