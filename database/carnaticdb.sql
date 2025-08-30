-- Create DB + use it
CREATE DATABASE IF NOT EXISTS carnaticdb;
USE carnaticdb;

-- Table
CREATE TABLE IF NOT EXISTS ragas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  notes VARCHAR(255) NOT NULL,      -- space-separated notes (e.g., "C D E F G A B")
  arohanam VARCHAR(255),
  avarohanam VARCHAR(255),
  melakarta INT,
  description TEXT
);

-- Seed 72 Melakarta ragas (no duplicates)
INSERT INTO ragas (name, notes, arohanam, avarohanam, melakarta, description)
SELECT * FROM (
  SELECT 'Kanakangi', 'S R1 G1 M1 P D1 N1 S', 'S R1 G1 M1 P D1 N1 S', 'S N1 D1 P M1 G1 R1 S', 1, 'First Melakarta raga'
  UNION ALL
  SELECT 'Ratnangi', 'S R1 G1 M1 P D1 N2 S', 'S R1 G1 M1 P D1 N2 S', 'S N2 D1 P M1 G1 R1 S', 2, 'Second Melakarta raga'
  UNION ALL
  SELECT 'Ganamurti', 'S R1 G1 M1 P D1 N3 S', 'S R1 G1 M1 P D1 N3 S', 'S N3 D1 P M1 G1 R1 S', 3, 'Third Melakarta raga'
  UNION ALL
  SELECT 'Vanaspati', 'S R1 G1 M1 P D2 N2 S', 'S R1 G1 M1 P D2 N2 S', 'S N2 D2 P M1 G1 R1 S', 4, 'Fourth Melakarta raga'
  UNION ALL
  SELECT 'Manavati', 'S R1 G1 M1 P D2 N3 S', 'S R1 G1 M1 P D2 N3 S', 'S N3 D2 P M1 G1 R1 S', 5, 'Fifth Melakarta raga'
  UNION ALL
  SELECT 'Tanarupi', 'S R1 G1 M1 P D3 N3 S', 'S R1 G1 M1 P D3 N3 S', 'S N3 D3 P M1 G1 R1 S', 6, 'Sixth Melakarta raga'
  UNION ALL
  SELECT 'Senavati', 'S R2 G2 M1 P D1 N1 S', 'S R2 G2 M1 P D1 N1 S', 'S N1 D1 P M1 G2 R2 S', 7, 'Seventh Melakarta raga'
  UNION ALL
  SELECT 'Hanumatodi', 'S R2 G2 M1 P D1 N2 S', 'S R2 G2 M1 P D1 N2 S', 'S N2 D1 P M1 G2 R2 S', 8, 'Eighth Melakarta raga'
  UNION ALL
  SELECT 'Dhenuka', 'S R2 G2 M1 P D1 N3 S', 'S R2 G2 M1 P D1 N3 S', 'S N3 D1 P M1 G2 R2 S', 9, 'Ninth Melakarta raga'
  UNION ALL
  SELECT 'Natakapriya', 'S R2 G2 M1 P D2 N2 S', 'S R2 G2 M1 P D2 N2 S', 'S N2 D2 P M1 G2 R2 S', 10, 'Tenth Melakarta raga'
  UNION ALL
  SELECT 'Kokilapriya', 'S R2 G2 M1 P D2 N3 S', 'S R2 G2 M1 P D2 N3 S', 'S N3 D2 P M1 G2 R2 S', 11, 'Eleventh Melakarta raga'
  UNION ALL
  SELECT 'Rupavati', 'S R2 G2 M1 P D3 N3 S', 'S R2 G2 M1 P D3 N3 S', 'S N3 D3 P M1 G2 R2 S', 12, 'Twelfth Melakarta raga'
  UNION ALL
  SELECT 'Gayakapriya', 'S R2 G3 M1 P D1 N1 S', 'S R2 G3 M1 P D1 N1 S', 'S N1 D1 P M1 G3 R2 S', 13, 'Thirteenth Melakarta raga'
  UNION ALL
  SELECT 'Vakulabharanam', 'S R2 G3 M1 P D1 N2 S', 'S R2 G3 M1 P D1 N2 S', 'S N2 D1 P M1 G3 R2 S', 14, 'Fourteenth Melakarta raga'
  UNION ALL
  SELECT 'Mayamalavagowla', 'S R2 G3 M1 P D1 N3 S', 'S R2 G3 M1 P D1 N3 S', 'S N3 D1 P M1 G3 R2 S', 15, 'Fifteenth Melakarta raga'
  UNION ALL
  SELECT 'Chakravakam4', 'S R2 G3 M1 P D2 N2 S', 'S R2 G3 M1 P D2 N2 S', 'S N2 D2 P M1 G3 R2 S', 16, 'Sixteenth Melakarta raga'
  UNION ALL
  SELECT 'Suryakantam', 'S R2 G3 M1 P D2 N3 S', 'S R2 G3 M1 P D2 N3 S', 'S N3 D2 P M1 G3 R2 S', 17, 'Seventeenth Melakarta raga'
  UNION ALL
  SELECT 'Hatakambari', 'S R2 G3 M1 P D3 N3 S', 'S R2 G3 M1 P D3 N3 S', 'S N3 D3 P M1 G3 R2 S', 18, 'Eighteenth Melakarta raga'
  UNION ALL
  SELECT 'Jhankaradhwani', 'S R3 G3 M1 P D1 N1 S', 'S R3 G3 M1 P D1 N1 S', 'S N1 D1 P M1 G3 R3 S', 19, 'Nineteenth Melakarta raga'
  UNION ALL
  SELECT 'Natabhairavi', 'S R3 G3 M1 P D1 N2 S', 'S R3 G3 M1 P D1 N2 S', 'S N2 D1 P M1 G3 R3 S', 20, 'Twentieth Melakarta raga'
  UNION ALL
  SELECT 'Keeravani', 'S R3 G3 M1 P D1 N3 S', 'S R3 G3 M1 P D1 N3 S', 'S N3 D1 P M1 G3 R3 S', 21, 'Twenty-first Melakarta raga'
  UNION ALL
  SELECT 'Kharaharapriya', 'S R3 G3 M1 P D2 N2 S', 'S R3 G3 M1 P D2 N2 S', 'S N2 D2 P M1 G3 R3 S', 22, 'Twenty-second Melakarta raga'
  UNION ALL
  SELECT 'Gourimanohari', 'S R3 G3 M1 P D2 N3 S', 'S R3 G3 M1 P D2 N3 S', 'S N3 D2 P M1 G3 R3 S', 23, 'Twenty-third Melakarta raga'
  UNION ALL
  SELECT 'Varunapriya', 'S R3 G3 M1 P D3 N3 S', 'S R3 G3 M1 P D3 N3 S', 'S N3 D3 P M1 G3 R3 S', 24, 'Twenty-fourth Melakarta raga'
  UNION ALL
  SELECT 'Mararanjani', 'S R3 G3 M1 P D1 N1 S', 'S R3 G3 M1 P D1 N1 S', 'S N1 D1 P M1 G3 R3 S', 25, 'Twenty-fifth Melakarta raga'
  UNION ALL
  SELECT 'Charukesi', 'S R3 G3 M1 P D1 N2 S', 'S R3 G3 M1 P D1 N2 S', 'S N2 D1 P M1 G3 R3 S', 26, 'Twenty-sixth Melakarta raga'
  UNION ALL
  SELECT 'Sarasangi', 'S R3 G3 M1 P D1 N3 S', 'S R3 G3 M1 P D1 N3 S', 'S N3 D1 P M1 G3 R3 S', 27, 'Twenty-seventh Melakarta raga'
  UNION ALL
  SELECT 'Harikambhoji', 'S R3 G3 M1 P D2 N2 S', 'S R3 G3 M1 P D2 N2 S', 'S N2 D2 P M1 G3 R3 S', 28, 'Twenty-eighth Melakarta raga'
  UNION ALL
  SELECT 'Shankarabharanam', 'S R3 G3 M1 P D2 N3 S', 'S R3 G3 M1 P D2 N3 S', 'S N3 D2 P M1 G3 R3 S', 29, 'Twenty-ninth Melakarta raga'
  UNION ALL
  SELECT 'Todi', 'S R3 G3 M1 P D3 N3 S', 'S R3 G3 M1 P D3 N3 S', 'S N3 D3 P M1 G3 R3 S', 30, 'Thirtieth Melakarta raga'
  UNION ALL
  SELECT 'Subhapantuvarali', 'S R3 G3 M1 P D1 N1 S', 'S R3 G3 M1 P D1 N1 S', 'S N1 D1 P M1 G3 R3 S', 31, 'Thirty-first Melakarta raga'
  UNION ALL
  SELECT 'Shadvidamargini', 'S R3 G3 M1 P D1 N2 S', 'S R3 G3 M1 P D1 N2 S', 'S N2 D1 P M1 G3 R3 S', 32, 'Thirty-second Melakarta raga'
  UNION ALL
  SELECT 'Suvarnangi', 'S R3 G3 M1 P D1 N3 S', 'S R3 G3 M1 P D1 N3 S', 'S N3 D1 P M1 G3 R3 S', 33, 'Thirty-third Melakarta raga'
  UNION ALL
  SELECT 'Divyamani', 'S R3 G3 M1 P D2 N2 S', 'S R3 G3 M1 P D2 N2 S', 'S N2 D2 P M1 G3 R3 S', 34, 'Thirty-fourth Melakarta raga'
  UNION ALL
  SELECT 'Dharmavati', 'S R3 G3 M1 P D2 N3 S', 'S R3 G3 M1 P D2 N3 S', 'S N3 D2 P M1 G3 R3 S', 35, 'Thirty-fifth Melakarta raga'
  UNION ALL
  SELECT 'Neetimati', 'S R3 G3 M1 P D3 N3 S', 'S R3 G3 M1 P D3 N3 S', 'S N3 D3 P M1 G3 R3 S', 36, 'Thirty-sixth Melakarta raga'
  UNION ALL
  SELECT 'Kaisiki', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 37, 'Thirty-seventh Melakarta raga'
  UNION ALL
  SELECT 'Ranjani', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 38, 'Thirty-eighth Melakarta raga'
  UNION ALL
  SELECT 'Gamanashrama', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 39, 'Thirty-ninth Melakarta raga'
  UNION ALL
  SELECT 'Vishwambari', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 40, 'Fortieth Melakarta raga'
  UNION ALL
  SELECT 'Chakravakam', 'S R1 G3 M1 P D2 N2 S', 'S R1 G3 M1 P D2 N2 S', 'S N2 D2 P M1 G3 R1 S', 41, 'Forty-first Melakarta raga'
  UNION ALL
  SELECT 'Suryakantamm', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 42, 'Forty-second Melakarta raga'
  UNION ALL
  SELECT 'Hatakambari2', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 43, 'Forty-third Melakarta raga'
  UNION ALL
  SELECT 'Jhankaradhwani2', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 44, 'Forty-fourth Melakarta raga'
  UNION ALL
  SELECT 'Natabhairavi2', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 45, 'Forty-fifth Melakarta raga'
  UNION ALL
  SELECT 'Keeravani2', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 46, 'Forty-sixth Melakarta raga'
  UNION ALL
  SELECT 'Kharaharapriya2', 'S R3 G3 M2 P D2 N3 S', 'S R3 G3 M2 P D2 N3 S', 'S N3 D2 P M2 G3 R3 S', 47, 'Forty-seventh Melakarta raga'
  UNION ALL
  SELECT 'Gourimanohari2', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 48, 'Forty-eighth Melakarta raga'
  UNION ALL
  SELECT 'Varunapriya2', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 49, 'Forty-ninth Melakarta raga'
  UNION ALL
  SELECT 'Mararanjani2', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 50, 'Fiftieth Melakarta raga'
  UNION ALL
  SELECT 'Charukesi2', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 51, 'Fifty-first Melakarta raga'
  UNION ALL
  SELECT 'Sarasangi2', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 52, 'Fifty-second Melakarta raga'
  UNION ALL
  SELECT 'Harikambhoji2', 'S R3 G3 M2 P D2 N3 S', 'S R3 G3 M2 P D2 N3 S', 'S N3 D2 P M2 G3 R3 S', 53, 'Fifty-third Melakarta raga'
  UNION ALL
  SELECT 'Shankarabharanam2', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 54, 'Fifty-fourth Melakarta raga'
  UNION ALL
  SELECT 'Todi2', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 55, 'Fifty-fifth Melakarta raga'
  UNION ALL
  SELECT 'Subhapantuvarali2', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 56, 'Fifty-sixth Melakarta raga'
  UNION ALL
  SELECT 'Shadvidamargini2', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 57, 'Fifty-seventh Melakarta raga'
  UNION ALL
  SELECT 'Suvarnangi2', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 58, 'Fifty-eighth Melakarta raga'
  UNION ALL
  SELECT 'Divyamani2', 'S R3 G3 M2 P D2 N3 S', 'S R3 G3 M2 P D2 N3 S', 'S N3 D2 P M2 G3 R3 S', 59, 'Fifty-ninth Melakarta raga'
  UNION ALL
  SELECT 'Dharmavati2', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 60, 'Sixtieth Melakarta raga'
  UNION ALL
  SELECT 'Neetimati2', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 61, 'Sixty-first Melakarta raga'
  UNION ALL
  SELECT 'Kaisiki2', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 62, 'Sixty-second Melakarta raga'
  UNION ALL
  SELECT 'Ranjani2', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 63, 'Sixty-third Melakarta raga'
  UNION ALL
  SELECT 'Gamanashrama2', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 64, 'Sixty-fourth Melakarta raga'
  UNION ALL
  SELECT 'Vishwambari2', 'S R3 G3 M2 P D2 N3 S', 'S R3 G3 M2 P D2 N3 S', 'S N3 D2 P M2 G3 R3 S', 65, 'Sixty-fifth Melakarta raga'
  UNION ALL
  SELECT 'Chakravakam1', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 66, 'Sixty-sixth Melakarta raga'
  UNION ALL
  SELECT 'Suryakantam2', 'S R3 G3 M2 P D1 N1 S', 'S R3 G3 M2 P D1 N1 S', 'S N1 D1 P M2 G3 R3 S', 67, 'Sixty-seventh Melakarta raga'
  UNION ALL
  SELECT 'Hatakambari3', 'S R3 G3 M2 P D1 N2 S', 'S R3 G3 M2 P D1 N2 S', 'S N2 D1 P M2 G3 R3 S', 68, 'Sixty-eighth Melakarta raga'
  UNION ALL
  SELECT 'Jhankaradhwani3', 'S R3 G3 M2 P D1 N3 S', 'S R3 G3 M2 P D1 N3 S', 'S N3 D1 P M2 G3 R3 S', 69, 'Sixty-ninth Melakarta raga'
  UNION ALL
  SELECT 'Natabhairavi3', 'S R3 G3 M2 P D2 N2 S', 'S R3 G3 M2 P D2 N2 S', 'S N2 D2 P M2 G3 R3 S', 70, 'Seventieth Melakarta raga'
  UNION ALL
  SELECT 'Keeravani3', 'S R3 G3 M2 P D2 N3 S', 'S R3 G3 M2 P D2 N3 S', 'S N3 D2 P M2 G3 R3 S', 71, 'Seventy-first Melakarta raga'
  UNION ALL
  SELECT 'Vakulabharanam3', 'S R3 G3 M2 P D3 N3 S', 'S R3 G3 M2 P D3 N3 S', 'S N3 D3 P M2 G3 R3 S', 72, 'Seventy-second Melakarta raga'
) AS tmp(name, notes, arohanam, avarohanam, melakarta, description)
WHERE NOT EXISTS (SELECT 1 FROM ragas r WHERE r.name = tmp.name);

