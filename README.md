# REST-API-med-PHP-og-MySQL

# man_best_friend API

Dette API giver dig mulighed for at hente, oprette, opdatere og slette oplysninger om "furry friends" (kæledyr). API’et er baseret på PHP og MySQL.

---

## Base URL

```text
http://localhost/man_best_friend/furry_friends
```

---

## HTTP Metoder

API’et understøtter følgende HTTP-metoder:

### GET

#### Hent alle venner

```http
GET http://localhost/man_best_friend/furry_friends/
```

**Response:**

```json
{
    "results": [
        {
            "breed": "Golden Retriever",
            "description": "A Golden Retriever is a friendly, loyal, and intelligent dog breed known for its gentle temperament and playful nature. They make excellent family pets and enjoy outdoor activities.",
            "longevity_in_years": 11,
            "weight_in_kg": 30,
            "activity_level": "high activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=1"
        },
        {
            "breed": "Siberian Husky",
            "description": "The Siberian Husky is an energetic, outgoing, and strong breed known for its striking looks and endurance. They are social dogs that need plenty of exercise and companionship.",
            "longevity_in_years": 12,
            "weight_in_kg": 27,
            "activity_level": "very high activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=2"
        },
        {
            "breed": "Labrador Retriever",
            "description": "The Labrador Retriever is friendly, outgoing, and eager to please. Labs are excellent family pets and often used as guide or service dogs due to their intelligence and calm nature.",
            "longevity_in_years": 12,
            "weight_in_kg": 32,
            "activity_level": "high activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=3"
        },
        {
            "breed": "Pembroke Welsh Corgi",
            "description": "The Pembroke Welsh Corgi is affectionate, intelligent, and alert. Known for their short legs and long bodies, they make loyal companions and are great with families.",
            "longevity_in_years": 13,
            "weight_in_kg": 12,
            "activity_level": "moderate activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=4"
        },
        {
            "breed": "Dachshund",
            "description": "The Dachshund is a small, curious, and courageous breed with a distinctive long body and short legs. They are playful and make loyal family pets.",
            "longevity_in_years": 14,
            "weight_in_kg": 9,
            "activity_level": "moderate activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=5"
        },
        {
            "breed": "Chihuahua",
            "description": "The Chihuahua is a tiny, alert, and confident dog with a big personality. They are loyal to their owners and adapt well to apartment living.",
            "longevity_in_years": 15,
            "weight_in_kg": 3,
            "activity_level": "low to moderate activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=6"
        },
        {
            "breed": "German Shepherd",
            "description": "The German Shepherd is an intelligent, courageous, and loyal working dog. They are highly trainable and excel as police, service, and family dogs.",
            "longevity_in_years": 10,
            "weight_in_kg": 35,
            "activity_level": "high activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=7"
        },
        {
            "breed": "The Border Collie.",
            "description": "The Border Collie is one of the most intelligent and energetic dog breeds.",
            "longevity_in_years": 11,
            "weight_in_kg": 12,
            "activity_level": "high activity level.",
            "url": "http://localhost/man_best_friend/furry_friends?id=8"
        },
        {
            "breed": "Poodle 3",
            "description": "Poodle (standard) Poodles are brilliant and highly trainable. The breed is also widely used in mixed breeds",
            "longevity_in_years": 12,
            "weight_in_kg": 11,
            "activity_level": "high activity level",
            "url": "http://localhost/man_best_friend/furry_friends?id=12"
        }
    ]
}
```

#### Hent én ven via ID

```http
GET http://localhost/man_best_friend/furry_friends?id=1
```

**Response:**

```json
{
    "id": 1,
    "breed": "Golden Retriever",
    "description": "A Golden Retriever is a friendly, loyal, and intelligent dog breed known for its gentle temperament and playful nature. They make excellent family pets and enjoy outdoor activities.",
    "longevity_in_years": 11,
    "weight_in_kg": 30,
    "activity_level": "high activity level",
    "media": [
        {
            "media_id": 1,
            "name": "adult_golden",
            "url": "https://unsplash.com/photos/portrait..."
        },
        {
            "media_id": 2,
            "name": "puppy_golden",
            "url": "https://unsplash.com/photos/golden..."
        }
    ],
    "links": {
        "self": "http://localhost/man_best_friend/furry_friends?id=1",
        "all": "http://localhost/man_best_friend/furry_friends",
        "delete": "http://localhost/man_best_friend/furry_friends?id=1"
    }
}
```

---

### POST

#### Opret en ny ven

```http
POST http://localhost/man_best_friend/furry_friends
```

**Body (x-www-form-urlencoded):**

![POST request example](/img/POST_example.png)


**Response:**

```json
{"message":"Created","id":"13"}
```

---

### PUT

#### Opdater en eksisterende ven

```http
PUT http://localhost/man_best_friend/furry_friends?id=8
```

**Body (raw eller x-www-form-urlencoded):**

![PUT request example](/img/PUT_example.png)

```json
{
    "id": 8,
    "breed": "The Border Collie :)",
    "description": "The Border Collie is one of the most intelligent and energetic dog breeds.",
    "longevity_in_years": 11,
    "weight_in_kg": 12,
    "activity_level": "incredibly high activity level."
}
```

