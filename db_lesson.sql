/* Q1 */

CREATE TABLE departments(
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* Q2 */

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

/* Q3 */

/* 部署の追加(departments) */
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

/* 人の追加(people) */
  INSERT INTO people (name, email, department_id, age, gender)
  VALUES
  ('永野ひろのぶ', 'nagano@gizumo.jp', 4, 54, 1),
  ('長谷部まさひろ', 'hasebe@gizumo.jp', 1, 48, 1),
  ('大前みれい', 'ohmae@gizumo.jp', 2, 27, 2),
  ('田口さとみ', 'taguchi@gizumo.jp', 2, 36 ,2),
  ('東野あつひこ', 'higashino@gizumo.jp', 2, 33, 1),
  ('平塚まお', 'hiratsuka@gizumo.jp', 1, 31, 2),
  ('諏訪しょういちろう', 'suwa@gizumo.jp', 2, 38, 1),
  ('坪井ゆみ', 'tsuboi@gizumo.jp', 3, 41, 2),
  ('安斎はるな', 'anzai@gizumo.jp', 1, 32, 2),
  ('樋口よしたか', 'higuchi@gizumo.jp', 5, 29, 1);

/* 日報の追加(reports) */
INSERT INTO reports (person_id, content)
VALUES
(7, '気がついてみると、さっきから、ごとごとごとごと、'),
(8, 'ジョバンニの乗っている小さな列車が走りつづけていたのでした。'),
(9, 'ほんとうにジョバンニは、夜の軽便鉄道の、'),
(10, '小さな黄いろの電燈のならんだ車室に、'),
(11, '窓から外を見ながら座っていたのです。'),
(12, '車室の中は、青い天鵞絨を張った腰掛けが、'),
(13, 'まるでがらあきで、向こうの鼠いろのワニスを塗った壁には、'),
(14, '真鍮の大きなぼたんが二つ光っているのでした。'),
(15, 'すぐ前の席に、ぬれたようにまっ黒な上着を着た、'),
(16, 'せいの高い子供が、窓から頭を出して外を見ているのに気がつきました。');

/* Q4 */

UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 5 WHERE person_id = 6;

/* Q5 */

SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

/* Q6 */

/* 「テーブル」「レコード」「カラム」という3つの単語を適切に使用して下記のSQL文を日本語で説明 */

SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

/* A.peopleテーブルから、部署IDが1（営業）に該当するレコードの、名前・eメール・年齢のカラムをレコードの作成日昇順で取得する */

/* Q7 */

SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

/* Q8 */

SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

/* Q9 */

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

/* Q10 */

SELECT p.name, p.department_id, r.content
FROM people AS p INNER JOIN reports AS r ON p.person_id = r.person_id
WHERE content IS NOT NULL;

/* Q11 */

SELECT p.name FROM people AS p LEFT OUTER JOIN reports AS r ON p.person_id = r.person_id WHERE r.content IS NULL;